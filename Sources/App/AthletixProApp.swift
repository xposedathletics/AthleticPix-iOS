import SwiftUI
 
@main
struct AthletixProApp: App {
    @StateObject private var store    = AthleteStore()
    @StateObject private var session  = TrainingSession()
    @StateObject private var tech     = TechManager()
 
    var body: some Scene {
        WindowGroup {
            ContentRootView()
                .environmentObject(store)
                .environmentObject(session)
                .environmentObject(tech)
                .preferredColorScheme(.dark)
        }
    }
}
