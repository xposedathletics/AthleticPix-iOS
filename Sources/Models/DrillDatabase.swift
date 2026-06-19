import Foundation
 
// ── Drill database — sport + position keyed ───────────────────────────────────
// "Sport|Position" → [Drill]
let DRILL_DB: [String:[Drill]] = [
    "Football|QB": [
        Drill(name:"40-Yard Dash",              cat:"Speed",        sets:3, reps:1,  projSec:5.2,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Track (Full)","Open Field"]),
        Drill(name:"Drop-Back Footwork Series", cat:"Footwork",     sets:4, reps:8,  projSec:30,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Indoor Court","Open Field"]),
        Drill(name:"Pocket Presence Drill",     cat:"Technique",    sets:3, reps:10, projSec:60,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Open Field"]),
        Drill(name:"Release Point Mechanics",   cat:"Arm Strength", sets:4, reps:15, projSec:45,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Open Field"]),
        Drill(name:"Decision-Speed Read Drill", cat:"Football IQ",  sets:3, reps:12, projSec:90,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Open Field","Cones"]),
        Drill(name:"Scramble & Reset Drill",    cat:"Agility",      sets:3, reps:6,  projSec:20,   usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Open Field","Cones"]),
        Drill(name:"Power Clean",               cat:"Strength",     sets:5, reps:3,  projSec:120,  usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Full Weight Room","Barbell + Plates"]),
        Drill(name:"Medicine Ball Rotational",  cat:"Core Power",   sets:4, reps:10, projSec:60,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Medicine Ball"]),
    ],
    "Football|RB": [
        Drill(name:"40-Yard Dash",              cat:"Speed",        sets:4, reps:1,  projSec:4.6,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Track (Full)","Open Field"]),
        Drill(name:"20-Yard Shuttle",           cat:"Agility",      sets:4, reps:1,  projSec:4.2,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Open Field","SMARTSPEED Gates"]),
        Drill(name:"Broad Jump",                cat:"Explosiveness",sets:4, reps:3,  projSec:10,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Open Field"]),
        Drill(name:"Sled Push (10yd)",          cat:"Strength",     sets:5, reps:5,  projSec:8,    usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Sleds","Open Field"]),
        Drill(name:"Broken Field Cone Drill",   cat:"Vision",       sets:4, reps:6,  projSec:30,   usesGPS:true,  usesWearable:true, usesSMARTSPEED:false, equipment:["Open Field","Cones"]),
        Drill(name:"Squat",                     cat:"Strength",     sets:5, reps:5,  projSec:150,  usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Full Weight Room","Barbell + Plates"]),
    ],
    "Track & Field (Running)|Sprints": [
        Drill(name:"Block Start Reaction",      cat:"Acceleration", sets:6, reps:1,  projSec:2.0,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Track (Full)","SMARTSPEED Gates"]),
        Drill(name:"30m Flying Sprint",         cat:"Top Speed",    sets:5, reps:1,  projSec:3.2,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Track (Full)"]),
        Drill(name:"60m Sprint",                cat:"Speed",        sets:4, reps:1,  projSec:7.0,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Track (Full)"]),
        Drill(name:"Wicket Drills (8 hurdles)", cat:"Stride Mech.", sets:4, reps:2,  projSec:12,   usesGPS:true,  usesWearable:true, usesSMARTSPEED:false, equipment:["Track (Full)","Hurdles"]),
        Drill(name:"A-Skip / B-Skip / C-Skip",  cat:"Technique",    sets:3, reps:3,  projSec:30,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Track (Full)","Open Field"]),
        Drill(name:"Parachute Sprint (30m)",    cat:"Resistance",   sets:5, reps:1,  projSec:5.0,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Track (Full)","Parachute"]),
        Drill(name:"Power Clean",               cat:"Strength",     sets:4, reps:3,  projSec:120,  usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Full Weight Room","Barbell + Plates"]),
    ],
    "Basketball|PG": [
        Drill(name:"Lane Agility Drill",        cat:"Agility",      sets:4, reps:1,  projSec:11.5, usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Indoor Court","SMARTSPEED Gates"]),
        Drill(name:"3/4 Court Sprint",          cat:"Speed",        sets:5, reps:1,  projSec:4.0,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Indoor Court"]),
        Drill(name:"Ball Handling Series",      cat:"Skill",        sets:1, reps:1,  projSec:300,  usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Indoor Court","Gym Floor Only"]),
        Drill(name:"3PT Shooting (150 shots)",  cat:"Shooting",     sets:5, reps:30, projSec:600,  usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Indoor Court"]),
        Drill(name:"Vertical Jump Training",    cat:"Explosiveness",sets:4, reps:5,  projSec:60,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Indoor Court","Box Jumps"]),
        Drill(name:"Suicides",                  cat:"Conditioning", sets:5, reps:1,  projSec:55,   usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Indoor Court"]),
    ],
    "Soccer|ST": [
        Drill(name:"Explosive Sprint (20m)",    cat:"Speed",        sets:8, reps:1,  projSec:3.2,  usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Open Field","SMARTSPEED Gates"]),
        Drill(name:"Finishing Drills (20 shots)",cat:"Technique",   sets:4, reps:5,  projSec:300,  usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Open Field"]),
        Drill(name:"Aerobic Interval (15:15)",  cat:"Endurance",    sets:12,reps:1,  projSec:30,   usesGPS:true,  usesWearable:true, usesSMARTSPEED:false, equipment:["Open Field","Track (Full)"]),
        Drill(name:"Squat Jump",                cat:"Power",        sets:4, reps:8,  projSec:60,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["No Equipment","Open Field"]),
    ],
]
 
// Fallback generic drills when no exact match
let GENERIC_DRILLS: [Drill] = [
    Drill(name:"Sprint Intervals (10×40m)",   cat:"Speed",        sets:10,reps:1,  projSec:8,    usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Open Field"]),
    Drill(name:"Agility Ladder Series",        cat:"Agility",      sets:4, reps:4,  projSec:20,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Agility Ladder","Indoor Court"]),
    Drill(name:"Jump Rope (3min)",             cat:"Conditioning", sets:3, reps:1,  projSec:180,  usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Jump Rope","No Equipment"]),
    Drill(name:"Bodyweight Circuit",           cat:"Strength",     sets:4, reps:15, projSec:240,  usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["No Equipment","Open Field"]),
    Drill(name:"Cone Shuttle",                 cat:"Agility",      sets:4, reps:3,  projSec:15,   usesGPS:true,  usesWearable:true, usesSMARTSPEED:true,  equipment:["Cones","Open Field"]),
    Drill(name:"Medicine Ball Slams",          cat:"Power",        sets:4, reps:10, projSec:60,   usesGPS:false, usesWearable:true, usesSMARTSPEED:false, equipment:["Medicine Ball","Open Field"]),
]
 
// Lookup with fallback
func getDrills(sport:String, position:String, availableEquipment:[String]) -> [Drill] {
    let key  = "\(sport)|\(position)"
    let base = DRILL_DB[key] ?? DRILL_DB["\(sport)|\(position.components(separatedBy:" ").first ?? "")"] ?? GENERIC_DRILLS
    guard !availableEquipment.isEmpty && !availableEquipment.contains("No Equipment") else { return base }
    return base.filter { $0.equipment.contains(where:{ availableEquipment.contains($0) }) }
}
