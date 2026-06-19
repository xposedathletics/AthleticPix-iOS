import SwiftUI
 
// ── Exact RefTrace color palette ─────────────────────────────────────────────
struct AP {
    // Gradient endpoints
    static let gradStart = Color(hex:"8B1A1A")
    static let gradEnd   = Color(hex:"146428")
    static let gold      = Color(hex:"C9A84C")
 
    // Surfaces (matches RefTrace)
    static let dark      = Color(hex:"080808")
    static let card      = Color.white.opacity(0.05)
    static let border    = Color.white.opacity(0.09)
    static let muted     = Color.white.opacity(0.42)
 
    // HR zone colors
    static let z1 = Color(hex:"60a5fa")
    static let z2 = Color(hex:"6ee7a0")
    static let z3 = Color(hex:"C9A84C")
    static let z4 = Color(hex:"f97316")
    static let z5 = Color(hex:"ef4444")
}
 
// App gradient (text + buttons)
struct APGradient: View {
    var body: some View {
        LinearGradient(colors:[AP.gradStart, AP.gradEnd],
                       startPoint:.topLeading, endPoint:.bottomTrailing)
    }
}
 
// Gradient-filled text
struct GradText: View {
    let text: String; let size: CGFloat; let weight: Font.Weight
    init(_ t:String, size:CGFloat=22, weight:Font.Weight = .black) { text=t; self.size=size; self.weight=weight }
    var body: some View {
        Text(text).font(.system(size:size, weight:weight))
            .foregroundStyle(LinearGradient(colors:[AP.gradStart, AP.gradEnd],
                                            startPoint:.topLeading, endPoint:.bottomTrailing))
    }
}
 
// Primary gradient button
struct GradBtn: View {
    let title: String; let action: ()->Void
    var icon: String = ""
    var body: some View {
        Button(action:action) {
            HStack {
                if !icon.isEmpty { Text(icon) }
                Text(title).fontWeight(.black)
            }
            .frame(maxWidth:.infinity).padding(14)
            .background(LinearGradient(colors:[AP.gradStart,AP.gradEnd],startPoint:.leading,endPoint:.trailing))
            .foregroundColor(.white).cornerRadius(12)
        }
    }
}
 
// Shared input modifier
extension View {
    func apInput() -> some View {
        self.padding(.horizontal,14).padding(.vertical,11)
            .background(Color.white.opacity(0.07))
            .foregroundColor(.white)
            .overlay(RoundedRectangle(cornerRadius:10).stroke(AP.border,lineWidth:1))
            .cornerRadius(10)
    }
}
 
// Section label
struct SectionLabel: View {
    let text: String
    init(_ t:String) { text=t }
    var body: some View {
        Text(text).font(.system(size:10,weight:.black))
            .foregroundColor(AP.muted).tracking(1.5).padding(.bottom,6)
    }
}
 
// Metric card
struct MetricCard: View {
    let label: String; let value: String; var color: Color = AP.gold
    var body: some View {
        VStack(spacing:3) {
            Text(value).font(.system(size:18,weight:.black,design:.monospaced)).foregroundColor(color)
            Text(label).font(.system(size:8,weight:.bold)).foregroundColor(AP.muted).multilineTextAlignment(.center)
        }
        .frame(maxWidth:.infinity).padding(10)
        .background(AP.card)
        .overlay(RoundedRectangle(cornerRadius:10).stroke(AP.border,lineWidth:1))
        .cornerRadius(10)
    }
}
 
// Tag pill
struct APTag: View {
    let text: String; var color: Color = AP.gold
    var body: some View {
        Text(text).font(.system(size:10,weight:.black))
            .padding(.horizontal,8).padding(.vertical,3)
            .background(color.opacity(0.15))
            .foregroundColor(color)
            .overlay(RoundedRectangle(cornerRadius:6).stroke(color.opacity(0.35),lineWidth:1))
            .cornerRadius(6)
    }
}
 
// Progress bar
struct APProgressBar: View {
    let pct: Double; var color: Color = AP.gold
    var body: some View {
        GeometryReader { g in
            ZStack(alignment:.leading) {
                RoundedRectangle(cornerRadius:3).fill(Color.white.opacity(0.08)).frame(height:5)
                RoundedRectangle(cornerRadius:3).fill(color).frame(width:g.size.width*min(1,pct/100),height:5)
            }
        }.frame(height:5)
    }
}
 
// Color(hex:) extension
extension Color {
    init(hex: String) {
        let h = hex.trimmingCharacters(in:.init(charactersIn:"#"))
        var v: UInt64 = 0; Scanner(string:h).scanHexInt64(&v)
        self.init(red:Double((v>>16)&0xFF)/255,green:Double((v>>8)&0xFF)/255,blue:Double(v&0xFF)/255)
    }
}
 
// Helpers
func fmtSecs(_ s:Int) -> String { String(format:"%02d:%02d",s/60,s%60) }
func wallNow() -> String { let f=DateFormatter(); f.timeStyle = .short; return f.string(from:Date()) }
func ageFrom(dob:String?) -> Int? {
    guard let d=dob, let date=ISO8601DateFormatter().date(from:d) else { return nil }
    return Calendar.current.dateComponents([.year],from:date,to:Date()).year
}
func htFt(_ inches:Double) -> String { "\(Int(inches/12))'\(Int(inches.truncatingRemainder(dividingBy:12)))\"" }
