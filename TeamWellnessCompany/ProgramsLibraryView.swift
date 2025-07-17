import SwiftUI

// ProgramsLibraryView.swift
// Ports programs components: Category list with details.
// Cleaned up with grouped list style.

struct ProgramsLibraryView: View {
    let categories: [String: [String]] = [
        "Stretch & Mobility": ["Full Body Flow", "Neck & Shoulder Relief", "Hip Flexor Release", "Daily 5-Min Stretch"],
        "Pain to Performance": ["Back Pain Relief", "Knee Strengthening", "Shoulder Recovery", "Foot & Ankle Care"],
        "Strength Foundations": ["Core Stability", "Glute Activation", "Scapular Strength", "Functional Movement"],
        "Breath & Stress": ["Box Breathing", "Guided Meditation", "Quick Calm", "Stress Release"],
        "Workplace Wellness": ["Desk Stretches", "Break-Time Reset", "Posture Fixes", "Remote Worker Mobility"],
        "Mindset & Growth": ["Visualization", "Sleep Wind-Down", "Motivation Boost", "Goal Setting"]
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { category in
                    Section(header: Text(category).font(.headline).foregroundColor(.havelockBlue)) {
                        ForEach(categories[category] ?? [], id: \.self) { program in
                            NavigationLink(destination: ProgramDetailView(program: program)) {
                                Text(program)
                                    .foregroundColor(.sereneWhite)
                            }
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Wellness Programs")
            .background(LinearGradient.oceanGradient.ignoresSafeArea())
        }
    }
}

struct ProgramDetailView: View {
    let program: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(program)
                .font(.title.bold())
                .foregroundColor(.sereneWhite)
            
            // Placeholder for overview video
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 200)
                .cornerRadius(12)
            
            Button("Add to My Plan") {
                // Logic to add
            }
            .buttonStyle(.borderedProminent)
            .tint(.havelockBlue)
            .foregroundColor(.sereneWhite)
            
            Button("Bookmark") {
                // Bookmark logic
            }
            .buttonStyle(.bordered)
            .tint(.havelockBlue)
            .foregroundColor(.sereneWhite)
        }
        .padding()
        .background(LinearGradient.nightSkyGradient.ignoresSafeArea())
        .navigationTitle(program)
    }
}
