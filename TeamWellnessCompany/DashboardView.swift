import SwiftUI

// DashboardView.swift
// Ports dashboard components: Daily hub with suggestions, progress, points.
// Added breathing animation to progress rings for mindfulness theme.

struct DashboardView: View {
    @State private var progress: Double = 0.7 // Example data
    @State private var scale = 1.0 // Breathing effect
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                // Header
                Text("Hello, Wellness Seeker")
                    .font(.largeTitle.bold())
                    .foregroundColor(.sereneWhite)
                Text("WellyPoints: 250 | Streak: 5 days")
                    .font(.subheadline)
                    .foregroundColor(.sereneWhite.opacity(0.8))
                
                // Progress Rings
                HStack(spacing: 20) {
                    ProgressRing(progress: progress, title: "Movement")
                    ProgressRing(progress: progress * 0.8, title: "Mindfulness")
                }
                .scaleEffect(scale)
                .onAppear {
                    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                        scale = 1.05
                    }
                }
                
                // Today's Suggestions
                Text("Today's Serene Suggestions")
                    .font(.headline)
                    .foregroundColor(.sereneWhite)
                
                SuggestionCard(title: "Gentle Morning Stretch", duration: "5 min", points: 10)
                SuggestionCard(title: "Calming Breathwork", duration: "3 min", points: 8)
                SuggestionCard(title: "Posture Alignment", duration: "2 min", points: 5)
            }
            .padding()
        }
        .background(LinearGradient.forestGradient.ignoresSafeArea())
    }
}

struct ProgressRing: View {
    let progress: Double
    let title: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 12)
                    .opacity(0.2)
                    .foregroundColor(.havelockBlue)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.havelockBlue)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeInOut, value: progress)
                
                Text(String(format: "%.0f%%", min(progress, 1.0) * 100))
                    .font(.title.bold())
                    .foregroundColor(.sereneWhite)
            }
            .frame(width: 120, height: 120)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.sereneWhite)
        }
    }
}

struct SuggestionCard: View {
    let title: String
    let duration: String
    let points: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline.bold())
                    .foregroundColor(.sereneWhite)
                Text(duration)
                    .font(.caption)
                    .foregroundColor(.sereneWhite.opacity(0.7))
            }
            Spacer()
            Text("+\(points) pts")
                .font(.caption.bold())
                .foregroundColor(.havelockBlue)
        }
        .padding()
        .background(Color.cloudBurst.opacity(0.6))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}
