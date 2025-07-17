import SwiftUI

// MainView.swift
// Root view managing onboarding and tab navigation.
// Ports React App.jsx as the main container, with conditional onboarding.

struct MainView: View {
    @AppStorage("hasOnboarded") private var hasOnboarded = false
    
    var body: some View {
        if !hasOnboarded {
            OnboardingView(onComplete: { hasOnboarded = true })
        } else {
            TabView {
                DashboardView()
                    .tabItem { Label("Dashboard", systemImage: "house.fill") }
                
                ProgramsLibraryView()
                    .tabItem { Label("Programs", systemImage: "book.fill") }
                
                CoachingView()
                    .tabItem { Label("Coaching", systemImage: "person.2.fill") }
                
                ChallengesView()
                    .tabItem { Label("Challenges", systemImage: "flame.fill") }
                
                SettingsView()
                    .tabItem { Label("Settings", systemImage: "gearshape.fill") }
            }
            .accentColor(.havelockBlue)
            .background(LinearGradient.oceanGradient.ignoresSafeArea())
        }
    }
}
