import Foundation
 
// ── Sport / Position / KPI master config ─────────────────────────────────────
struct SportConfig {
    let positions: [String]
    let kpis:      [String:[String]]
    let focusCategories: [String]
}
 
let SPORT_CONFIG: [String:SportConfig] = [
    "Football": SportConfig(
        positions: ["QB","RB","WR","OL","TE","DL","DE","OLB","MLB","CB","FS","SS","K/P"],
        kpis: [
            "QB":  ["40yd Dash","Arm Strength(mph)","Accuracy%","Decision Speed(ms)","Release Time(ms)","Pocket Mobility","Completion%"],
            "RB":  ["40yd Dash","20yd Shuttle","Broad Jump","Vertical","Carry Avg","Break Tackle Rate","Vision Score"],
            "WR":  ["40yd Dash","Route Separation(yd)","Catch Radius","Contested Catch%","Vertical","Release Speed","RAC"],
            "OL":  ["10yd Split","Power Clean(lbs)","Squat(lbs)","Bench(lbs)","Pass Block%","Run Block%","Lateral Agility"],
            "TE":  ["40yd Dash","Vertical","Broad Jump","Block%","Route Sep","Catch%","Red Zone Conv%"],
            "DL":  ["10yd Burst","Bench(lbs)","Squat(lbs)","Pass Rush Win%","Run Stop%","Gap Discipline","Motor"],
            "DE":  ["40yd Dash","Bench(lbs)","Get-Off(ms)","Pass Rush Win%","Bend","Motor","Sack/Game"],
            "OLB": ["40yd Dash","3-Cone","Pass Rush%","Coverage%","Blitz Success%","Tackle Efficiency","Range"],
            "MLB": ["40yd Dash","3-Cone","Instinct Score","Zone Coverage%","Blitz%","Tackle Eff","Range"],
            "CB":  ["40yd Dash","10yd Split","3-Cone","Man Coverage%","Zone Coverage%","Ball Production","Jam%"],
            "FS":  ["40yd Dash","3-Cone","Range","Angle of Pursuit","Ball Hawk Rate","Hit Power","Coverage IQ"],
            "SS":  ["40yd Dash","Bench(lbs)","Coverage%","Run Support%","Blitz%","Hit Power","Alignment IQ"],
            "K/P": ["Kickoff Hang Time","FG%","FG Distance(yd)","Punt Avg","Punt Net","Directional%","Consistency"],
        ],
        focusCategories: ["Speed","Strength","Agility","Explosiveness","Technique","Endurance","Football IQ"]
    ),
    "Flag Football": SportConfig(
        positions: ["QB","WR","DF"],
        kpis: [
            "QB": ["40yd Dash","Arm Strength(mph)","Accuracy%","Release Time(ms)","Decision Speed(ms)","Pocket Mobility","TD:INT"],
            "WR": ["40yd Dash","Route Separation","Catch%","Yards After Catch","Flag Evasion","Release Speed","Explosive Score"],
            "DF": ["40yd Dash","3-Cone","Flag Pull Rate","Coverage%","Reaction Time(ms)","Range","Contested Stop%"],
        ],
        focusCategories: ["Speed","Route Running","Flag Defense","Catching","Agility","Fitness"]
    ),
    "Track & Field (Running)": SportConfig(
        positions: ["Sprints","Long Distance"],
        kpis: [
            "Sprints":       ["100m Time","60m Time","200m Time","400m Time","Reaction Time(ms)","Acceleration Phase(m)","Top Speed(mph)","Step Rate","Stride Length(m)","Block Start Score"],
            "Long Distance": ["Mile Time","2-Mile Time","5K Time","10K Time","VO2 Max","Lactate Threshold HR","Avg Pace(min/mi)","Cadence(spm)","Ground Contact Time(ms)","Running Economy"],
        ],
        focusCategories: ["Speed Endurance","Acceleration","Stride Mechanics","Aerobic Base","Lactate Threshold","Recovery","Mental Toughness"]
    ),
    "Track & Field (Field)": SportConfig(
        positions: ["Long Jump","Triple Jump","High Jump","Pole Vault","Shot Put","Discus","Javelin","Hammer","Decathlon","Heptathlon"],
        kpis: [
            "Long Jump":   ["Best Mark(ft)","Average Mark","Approach Speed(mph)","Takeoff Angle","Board Hit%","Hang Time(ms)","Horizontal Velocity"],
            "Triple Jump": ["Best Mark(ft)","Phase Ratio","Approach Speed","Hop Power","Step Power","Jump Power","Board Hit%"],
            "High Jump":   ["Best Mark(in)","Approach Speed","Takeoff Angle","Bar Clearance","Consistency%","Bar Drill Score","Vertical"],
            "Pole Vault":  ["Best Mark(ft)","Run-up Speed","Grip Height","Plant Box Accuracy","Swing Score","Extension Score","Clearance Margin"],
            "Shot Put":    ["Best Mark(ft)","Avg Release Velocity(mph)","Release Angle","Spin Technique Score","Power Clean(lbs)","Squat(lbs)","Consistency%"],
            "Discus":      ["Best Mark(ft)","Release Speed(mph)","Spin Rate","Release Angle","Approach Score","Consistency%","Wind Adj Mark"],
            "Javelin":     ["Best Mark(ft)","Release Speed(mph)","Release Angle","Run-up Speed","Elbow Extension Score","Consistency%","Surface Adj Mark"],
            "Hammer":      ["Best Mark(ft)","Release Speed(mph)","Rotation Speed","Low Point Score","Release Angle","Entry Speed","Consistency%"],
            "Decathlon":   ["100m","LJ","Shot Put","HJ","400m","110mH","Discus","PV","Javelin","1500m"],
            "Heptathlon":  ["100mH","HJ","Shot Put","200m","LJ","Javelin","800m"],
        ],
        focusCategories: ["Power","Technique","Approach Speed","Consistency","Explosive Strength","Flexibility","Event-Specific"]
    ),
    "Basketball": SportConfig(
        positions: ["PG","SG","SF","PF","C"],
        kpis: [
            "PG": ["Lane Agility","3/4 Sprint","Vertical","Standing Reach","Hand Size","Court Vision Score","3PT%","Assists/Game","TO Rate"],
            "SG": ["Lane Agility","3/4 Sprint","Vertical","Wingspan","3PT%","Mid-Range%","Scoring Avg","Off Movement Score"],
            "SF": ["Lane Agility","Vertical","Wingspan","Standing Reach","Versatility Score","PnR Defense%","3PT%","Rebound Rate"],
            "PF": ["Lane Agility","Vertical","Wingspan","Standing Reach","Block%","Rebound%","Post Score","Screen IQ"],
            "C":  ["Lane Agility","Vertical","Wingspan","Standing Reach","Block%","Rebound%","Screen%","Post Efficiency"],
        ],
        focusCategories: ["Ball Handling","Shooting","Defense","Finishing","Court Vision","Conditioning","Strength"]
    ),
    "Baseball": SportConfig(
        positions: ["P","C","1B","2B","3B","SS","LF","CF","RF","DH"],
        kpis: [
            "P":  ["Fastball Velo(mph)","Spin Rate(rpm)","Command Score","Whiff%","Groundball%","Extension(ft)","Deception Score"],
            "C":  ["Pop Time(sec)","Framing Score","Arm Strength(mph)","Blocking Score","Game Calling IQ","Exit Velo(mph)","Caught Stealing%"],
            "1B": ["Exit Velo(mph)","Hard Hit%","Launch Angle","xwOBA","First Step Quickness","Scoop%","Sprint Speed(ft/s)"],
            "DH": ["Exit Velo(mph)","Hard Hit%","Launch Angle","xwOBA","Barrel%","Chase%","Whiff%"],
        ],
        focusCategories: ["Hitting","Pitching","Fielding","Speed","Arm Strength","Game IQ","Conditioning"]
    ),
    "Softball": SportConfig(
        positions: ["P","C","1B","2B","3B","SS","LF","CF","RF","DP/FLEX"],
        kpis: [
            "P":       ["Pitch Velo(mph)","Spin Rate","Rise Ball Score","Drop Ball Score","Changeup Score","Location%","Whiff%"],
            "DP/FLEX": ["Exit Velo","Sprint Speed","First Step","Range Factor","Arm Strength","Hard Hit%","OPS"],
        ],
        focusCategories: ["Hitting","Pitching","Fielding","Speed","Arm Strength","Game IQ","Conditioning"]
    ),
    "Soccer": SportConfig(
        positions: ["GK","CB","RB","LB","CDM","CM","CAM","RW","LW","ST","CF"],
        kpis: [
            "GK": ["Reaction Time(ms)","Distribution Score","Cross Claim%","Line Command%","Shot Stop%","Aerial%","Sweeper Keeper IQ"],
            "CB": ["Aerial Win%","Tackle%","Interception Rate","Pass Completion%","Sprint Speed","Positioning Score","Recovery Run"],
            "ST": ["Goals/Game","xG","Shot Accuracy","Aerial Win%","Hold-up Play","Sprint Speed","Press Intensity"],
            "CM": ["Pass Completion%","Progressive Carries","Key Passes","Pressing Score","Box-to-Box KM","Duels Won%","xA"],
        ],
        focusCategories: ["Technical","Physical","Tactical","Speed","Endurance","Positioning","Set Pieces"]
    ),
]
 
// Equipment
let EQUIPMENT_OPTIONS = [
    "Full Weight Room","Resistance Bands","Pull-up Bar","Dumbbells Only","Barbell + Plates",
    "Track (Full)","Track (Partial / Grass)","Open Field","Indoor Court","Gym Floor Only",
    "Agility Ladder","Cones","Hurdles","Sleds","Parachute","Medicine Ball",
    "Jump Rope","Box Jumps","SMARTSPEED Gates","Video Camera","No Equipment",
]
let WEARABLE_DEVICES = [
    "Apple Watch","Garmin","Polar","WHOOP","Catapult OneR","Zebra Athlete Tracking",
    "Kinexon","STATSports Apex","PlayerTek","Fitbit","Samsung Galaxy Watch",
    "Suunto","Coros","Wahoo TICKR","Manual Entry",
]
let CAMERA_SYSTEMS = [
    "Hudl Sideline","Catapult Vision","Dartfish","CoachMePlus","GoPro + Sensor",
    "Veo Camera","Trace Sports Camera","Perch Performance","Manual Upload","None",
]
let SMARTSPEED_SYSTEMS = [
    "Brower Timing","Freelap","SMARTSPEED Pro","Fusion Sport SMARTSPEED",
    "Dashr Laser","Swift Performance","Manual Timing","None",
]
