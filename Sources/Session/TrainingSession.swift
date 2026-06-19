import Foundation
import Combine
 
// ── TrainingSession — manages the active workout ──────────────────────────────
class TrainingSession: ObservableObject {
    @Published var sport:    String = ""
    @Published var position: String = ""
    @Published var plan:     [Drill] = []
    @Published var currentIdx: Int = 0
    @Published var logs:     [TrainingLog] = []
    @Published var phase:    Phase = .idle
    @Published var drillClock: Int = 0
    @Published var drillRunning: Bool = false
    @Published var setsDone: Int = 0
    @Published var rpe:      Int = 5
    @Published var summary:  SessionSummary? = nil
 
    let sessionId = "AP-\(Int(Date().timeIntervalSince1970))"
    let startTime = Date()
    private var clockTimer: Timer?
 
    enum Phase { case idle, active, complete }
 
    var current: Drill? { currentIdx < plan.count ? plan[currentIdx] : nil }
    var progress: Double { plan.isEmpty ? 0 : Double(logs.count)/Double(plan.count)*100 }
 
    func start(athlete:Athlete, sport:String, position:String, pastLogs:[TrainingLog], equipment:[String]) {
        self.sport    = sport
        self.position = position
        self.plan     = PlanEngine.generate(athlete:athlete, sport:sport, position:position,
                                            pastLogs:pastLogs, availableEquipment:equipment)
        currentIdx    = 0; logs = []; drillClock = 0; setsDone = 0
        phase         = .active
    }
 
    func toggleClock() {
        drillRunning.toggle()
        if drillRunning {
            clockTimer = Timer.scheduledTimer(withTimeInterval:1, repeats:true) { [weak self] _ in
                self?.drillClock += 1
            }
        } else {
            clockTimer?.invalidate()
        }
    }
 
    func completeDrill(tech: TechManager, athlete: Athlete) {
        guard let d = current else { return }
        drillRunning = false; clockTimer?.invalidate()
        let adj = adjustIntensity(drill:d, hr:tech.hr, hrMax:tech.hrMax, rpe:rpe)
        let log = TrainingLog(
            athlete_id:        athlete.id,
            drill_name:        d.name,
            sport:             sport,
            position:          position,
            category:          d.cat,
            projected_time_sec:d.projSec * Double(d.sets),
            actual_time_sec:   Double(drillClock),
            completion_pct:    d.sets > 0 ? min(100, Double(setsDone)/Double(d.sets)*100) : 0,
            sets:              d.sets,
            sets_completed:    setsDone,
            reps:              d.reps,
            heart_rate_avg:    tech.hr,
            heart_rate_max:    tech.hr + 8,
            hrv:               tech.hrv,
            spo2:              tech.spo2,
            gps_distance_miles:tech.distance,
            gps_speed_max_mph: tech.speed,
            acceleration_peak: tech.acceleration,
            smartspeed_splits: tech.splits.map { ["set":"\($0.setNumber)","time":"\($0.time)"] },
            rpe:               rpe,
            intensity_adjusted:adj.adjusted,
            intensity_reason:  adj.reason,
            ai_feedback:       aiFeedback(drill:d,setsDone:setsDone,hr:tech.hr,hrMax:tech.hrMax,rpe:rpe),
            date:              ISO8601DateFormatter().string(from:Date()),
            session_id:        sessionId
        )
        logs.append(log)
        var updated = plan
        updated[currentIdx].status = .done
        plan = updated
        drillClock = 0; setsDone = 0; tech.clearSplits()
        if currentIdx < plan.count - 1 {
            currentIdx += 1
        } else {
            buildSummary(); phase = .complete
        }
    }
 
    private func buildSummary() {
        let dur = Int(Date().timeIntervalSince(startTime)/60)
        summary = SessionSummary(
            total_drills:    plan.count,
            completed:       logs.count,
            total_sets:      logs.reduce(0){$0+$1.sets_completed},
            avg_hr:          logs.isEmpty ? 0 : logs.reduce(0){$0+$1.heart_rate_avg}/logs.count,
            max_hr:          logs.map(\.heart_rate_max).max() ?? 0,
            total_distance:  logs.reduce(0){$0+$1.gps_distance_miles}.rounded(toPlaces:2),
            avg_rpe:         logs.isEmpty ? 0 : (logs.reduce(0.0){$0+Double($1.rpe)}/Double(logs.count)).rounded(toPlaces:1),
            intensity_adjustments: logs.filter(\.intensity_adjusted).count,
            duration_min:    dur
        )
    }
}
extension Double { func rounded(toPlaces p:Int)->Double { let f=pow(10.0,Double(p)); return (self*f).rounded()/f } }
