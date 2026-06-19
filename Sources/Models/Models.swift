import Foundation
 
// ── Athlete (mirrors APAthlete entity in Comeback Season) ─────────────────────
struct Athlete: Identifiable, Codable {
    var id: String = UUID().uuidString
    var full_name:   String = ""
    var dob:         String = ""
    var age:         Int?
    var gender:      String = "Male"
    var school:      String = ""
    var grad_year:   String = ""
    var gpa:         Double = 0
    var height_in:   Double = 0
    var weight_lbs:  Double = 0
    var body_fat_pct:Double = 0
    var wingspan_in: Double = 0
    var hand_size_in:Double = 0
    var sports:      [String] = []
    var positions:   [String:[String]] = [:]
    var kpis:        [String:[String:String]] = [:]
    var focus_areas: [String] = []
    var available_equipment:[String] = []
    var parent_id:   String = ""
    var coach_emails:[String:String] = [:]
    var admin_emails:[String] = []
    var profile_photo_url: String = ""
    var status:      String = "Active"
    var wearable_device:  String = ""
    var wearable_connected:Bool = false
    var smartspeed_id:    String = ""
    var camera_system:    String = ""
    var comeback_season_id: String = ""
    var notes:       String = ""
}
 
// ── Training Drill ────────────────────────────────────────────────────────────
struct Drill: Identifiable, Codable {
    var id = UUID()
    let name:      String
    let cat:       String
    var sets:      Int
    var reps:      Int
    let projSec:   Double
    let usesGPS:   Bool
    let usesWearable: Bool
    let usesSMARTSPEED: Bool
    let equipment: [String]
    // Live state
    var status:    DrillStatus = .pending
    var setsDone:  Int = 0
    var actualSec: Int = 0
    var hrAvg:     Int = 0
    var hrPeak:    Int = 0
 
    enum DrillStatus: String, Codable { case pending, active, done }
    enum CodingKeys: String, CodingKey {
        case id,name,cat,sets,reps,projSec,usesGPS,usesWearable,usesSMARTSPEED,equipment,status,setsDone,actualSec,hrAvg,hrPeak
    }
}
 
// ── Training Log (mirrors APTrainingLog entity) ───────────────────────────────
struct TrainingLog: Identifiable, Codable {
    var id = UUID()
    var athlete_id:       String = ""
    var drill_name:       String = ""
    var sport:            String = ""
    var position:         String = ""
    var category:         String = ""
    var projected_time_sec: Double = 0
    var actual_time_sec:  Double = 0
    var completion_pct:   Double = 0
    var sets:             Int = 0
    var sets_completed:   Int = 0
    var reps:             Int = 0
    var heart_rate_avg:   Int = 0
    var heart_rate_max:   Int = 0
    var hrv:              Int = 0
    var spo2:             Int = 0
    var gps_distance_miles: Double = 0
    var gps_speed_max_mph:  Double = 0
    var acceleration_peak:  Double = 0
    var smartspeed_splits:  [[String:String]] = []
    var rpe:              Int = 5
    var intensity_adjusted: Bool = false
    var intensity_reason: String = ""
    var ai_feedback:      String = ""
    var date:             String = ""
    var session_id:       String = ""
}
 
// ── SMARTSPEED split ──────────────────────────────────────────────────────────
struct SMARTSPEEDSplit: Identifiable, Codable {
    var id = UUID()
    var setNumber: Int
    var time:      Double  // seconds
}
 
// ── Session summary ───────────────────────────────────────────────────────────
struct SessionSummary: Codable {
    var total_drills:    Int = 0
    var completed:       Int = 0
    var total_sets:      Int = 0
    var avg_hr:          Int = 0
    var max_hr:          Int = 0
    var total_distance:  Double = 0
    var avg_rpe:         Double = 0
    var intensity_adjustments: Int = 0
    var duration_min:    Int = 0
}
 
// ── Parent ────────────────────────────────────────────────────────────────────
struct Parent: Identifiable, Codable {
    var id: String = UUID().uuidString
    var full_name:   String = ""
    var email:       String = ""
    var phone:       String = ""
    var athlete_ids: [String] = []
}
