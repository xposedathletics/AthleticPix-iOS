import Foundation
 
// ── 3-priority training plan generator ───────────────────────────────────────
//  Priority 1 — Athlete focus areas (from Comeback Season)
//  Priority 2 — Past training performance (completion %)
//  Priority 3 — Available equipment vs drill requirements
struct PlanEngine {
    static func generate(
        athlete: Athlete,
        sport: String,
        position: String,
        pastLogs: [TrainingLog],
        availableEquipment: [String],
        maxDrills: Int = 8
    ) -> [Drill] {
        var drills = getDrills(sport:sport, position:position, availableEquipment:availableEquipment)
        let focusAreas = Array(athlete.focus_areas.prefix(3))
 
        let scored: [(Drill,Int)] = drills.map { d in
            var score = 0
            // P1: focus area match → highest weight
            let focusMatch = focusAreas.contains(where: {
                d.cat.lowercased().contains($0.lowercased()) || $0.lowercased().contains(d.cat.lowercased())
            })
            if focusMatch { score += 100 }
 
            // P2: past performance
            let past = pastLogs.filter { $0.drill_name == d.name }
            if past.isEmpty { score += 30 }
            else {
                let avgComp = past.map(\.completion_pct).reduce(0,+) / Double(past.count)
                if avgComp < 70 { score += 50 }
                else if avgComp < 90 { score += 20 }
            }
 
            // P3: equipment match
            if availableEquipment.isEmpty || d.equipment.contains(where:{ availableEquipment.contains($0) }) {
                score += 10
            }
            return (d, score)
        }
 
        return scored.sorted { $0.1 > $1.1 }.prefix(maxDrills).map { $0.0 }
    }
}
 
// ── Intensity adjustment (wearable-driven) ───────────────────────────────────
struct IntensityResult {
    var drill:    Drill
    var adjusted: Bool
    var reason:   String
}
 
func adjustIntensity(drill: Drill, hr: Int, hrMax: Int, rpe: Int) -> IntensityResult {
    guard hr > 0, hrMax > 0 else { return IntensityResult(drill:drill,adjusted:false,reason:"") }
    let pct = Double(hr) / Double(hrMax) * 100.0
    var d = drill; var reason = ""
    if pct > 92 {
        d.sets = max(1, Int(Double(d.sets)*0.7))
        d.reps = max(1, Int(Double(d.reps)*0.7))
        reason = String(format:"HR at %.0f%% max — intensity reduced 30%%",pct)
    } else if pct > 85 {
        d.sets = max(1, Int(Double(d.sets)*0.85))
        d.reps = max(1, Int(Double(d.reps)*0.85))
        reason = String(format:"HR at %.0f%% max — intensity reduced 15%%",pct)
    } else if pct < 60 && rpe < 4 {
        d.sets = Int(Double(d.sets)*1.2)
        d.reps = Int(Double(d.reps)*1.2)
        reason = "HR low + RPE \(rpe) — intensity increased 20%"
    }
    let wasAdjusted = !reason.isEmpty
    return IntensityResult(drill:d,adjusted:wasAdjusted,reason:reason)
}
 
// ── AI feedback text ──────────────────────────────────────────────────────────
func aiFeedback(drill:Drill, setsDone:Int, hr:Int, hrMax:Int, rpe:Int) -> String {
    let comp = drill.sets > 0 ? Int(Double(setsDone)/Double(drill.sets)*100) : 0
    let pct  = hrMax > 0 ? Int(Double(hr)/Double(hrMax)*100) : 0
    let zoneLabel = pct > 90 ? "Z5 Max" : pct > 80 ? "Z4 Threshold" : pct > 70 ? "Z3 Tempo" : pct > 60 ? "Z2 Aerobic" : "Z1 Recovery"
    var fb = "Completed \(setsDone)/\(drill.sets) sets at \(zoneLabel). "
    fb += comp >= 90 ? "Excellent — maintain or increase load next session. " :
          comp >= 70 ? "Good effort — slight load reduction may help full completion. " :
                       "Below target — review equipment or reduce intensity. "
    if rpe >= 9 { fb += "RPE very high — prioritize recovery." }
    else if rpe <= 3 { fb += "RPE low — ready to increase training volume." }
    return fb
}
