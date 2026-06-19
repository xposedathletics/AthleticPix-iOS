// swift-tools-version: 5.9
import PackageDescription
 
let package = Package(
    name: "AthletixPro",
    platforms: [.iOS(.v17)],
    targets: [
        .executableTarget(
            name: "AthletixPro",
            path: ".",
            sources: [
                "App/AthletixProApp.swift",
                "Brand/Brand.swift",
                "Config/SportConfig.swift",
                "Models/Models.swift",
                "Models/DrillDatabase.swift",
                "Engine/PlanEngine.swift",
                "Engine/AthleteStore.swift",
                "Engine/TechManager.swift",
                "Session/TrainingSession.swift",
                "Views/ContentRootView.swift",
                "Views/HomeView.swift",
                "Views/SportPositionFlow.swift",
                "Views/ActiveSessionView.swift",
                "Views/CompleteView.swift"
            ]
        )
    ]
)
