import SwiftUI
 
struct ContentRootView: View {
    @EnvironmentObject var session: TrainingSession
    var body: some View {
        ZStack {
            AP.dark.ignoresSafeArea()
            switch session.phase {
            case .idle:     HomeView()
            case .active:   ActiveSessionView()
            case .complete: CompleteView()
            }
        }
        .preferredColorScheme(.dark)
    }
}
