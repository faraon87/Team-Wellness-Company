// TeamWellnessCompanyApp.swift
// Main entry point for the Team Wellness Company iOS app.
// Rebuilt with SwiftUI, incorporating serene mindfulness theme: minimalistic UI, soft animations, nature-inspired gradients.
// Color palette: Cloud Burst (#1B2250), Havelock Blue (#6282E3), White (#FFFFFF).
// Ported concepts from React structure (components for onboarding, dashboard, etc.) to SwiftUI Views.
// Cleaned up: Added comments, organized files logically, ensured consistent theme, added soft breathing animations where appropriate.
// No direct code from GitHub as repo appears to contain only structural descriptions in README; translated feature specs to native iOS.

import SwiftUI

@main
struct TeamWellnessCompanyApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark) // Dark mode for calming, tranquil atmosphere
        }
    }
}
