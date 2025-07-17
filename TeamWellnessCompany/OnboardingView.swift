import SwiftUI

// OnboardingView.swift
// Multi-step onboarding flow, ported from onboarding components.
// Swipeable pages with progress, soft fade animations.

struct OnboardingView: View {
    @State private var currentStep = 0
    let onComplete: () -> Void
    
    var body: some View {
        TabView(selection: $currentStep) {
            WelcomeScreen().tag(0)
            AuthenticationScreen().tag(1)
            GoalSettingScreen().tag(2)
            BaselineAssessmentScreen().tag(3)
            DeviceIntegrationScreen(onComplete: onComplete).tag(4)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .background(LinearGradient.nightSkyGradient.ignoresSafeArea())
        .transition(.opacity) // Soft fade between steps
        .animation(.easeInOut(duration: 0.5), value: currentStep)
    }
}

struct WelcomeScreen: View {
    @State private var scale = 1.0 // Breathing animation for logo
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "leaf.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.sereneWhite)
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        scale = 1.05 // Subtle breathing effect
                    }
                }
            Text("Welcome to Team Welly")
                .font(.largeTitle.bold())
                .foregroundColor(Color.sereneWhite)
            Text("Embark on your wellness journey.")
                .font(.subheadline)
                .foregroundColor(Color.sereneWhite.opacity(0.8))
        }
        .padding()
    }
}

struct AuthenticationScreen: View {
    @State private var companyCode = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In or Sign Up")
                .font(.title.bold())
                .foregroundColor(Color.sereneWhite)
            
            TextField("Company Code (Optional)", text: $companyCode)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(Color.cloudBurst)
                .background(Color.sereneWhite.opacity(0.1))
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(Color.cloudBurst)
                .background(Color.sereneWhite.opacity(0.1))
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(Color.cloudBurst)
                .background(Color.sereneWhite.opacity(0.1))
            
            Button("Continue") {
                // Handle authentication logic (placeholder)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.havelockBlue)
            .foregroundColor(Color.sereneWhite)
        }
        .padding()
    }
}

struct GoalSettingScreen: View {
    @State private var selectedGoals: Set<String> = []
    let goals = ["Reduce Pain", "Improve Flexibility", "Boost Mental Health", "Increase Productivity", "Better Sleep", "More Energy"]
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Select Your Wellness Goals")
                .font(.title.bold())
                .foregroundColor(Color.sereneWhite)
            
            ForEach(goals, id: \.self) { goal in
                Toggle(goal, isOn: Binding(get: { selectedGoals.contains(goal) }, set: { if $0 { selectedGoals.insert(goal) } else { selectedGoals.remove(goal) } }))
                    .toggleStyle(SwitchToggleStyle(tint: Color.havelockBlue))
                    .foregroundColor(Color.sereneWhite)
                    .padding(.vertical, 5)
            }
        }
        .padding()
    }
}

struct BaselineAssessmentScreen: View {
    @State private var stressLevel: Double = 5
    // Add more assessment fields as per spec
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Baseline Assessment")
                .font(.title.bold())
                .foregroundColor(Color.sereneWhite)
            
            Text("Current Stress Level (1-10)")
                .foregroundColor(Color.sereneWhite)
            Slider(value: $stressLevel, in: 1...10, step: 1)
                .accentColor(Color.havelockBlue)
            
            // Add sleep quality dropdown, body map, etc. (placeholders)
        }
        .padding()
    }
}

struct DeviceIntegrationScreen: View {
    let onComplete: () -> Void
    let devices = ["Apple Health", "Fitbit", "Garmin", "Oura Ring"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Connect Devices for Better Insights")
                .font(.title.bold())
                .foregroundColor(Color.sereneWhite)
            
            ForEach(devices, id: \.self) { device in
                Button("Connect \(device)") {
                    // Integration logic (e.g., HealthKit permissions)
                }
                .buttonStyle(.bordered)
                .tint(Color.havelockBlue)
                .foregroundColor(Color.sereneWhite)
            }
            
            Button("Skip for Now") {
                onComplete()
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.havelockBlue)
            .foregroundColor(Color.sereneWhite)
        }
        .padding()
    }
}
