import SwiftUI

// ChallengesView.swift
// Ports gamification components: Challenges, leaderboards.

struct ChallengesView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Text("Engage in Challenges")
                    .font(.title.bold())
                    .foregroundColor(.sereneWhite)
                
                ChallengeCard(title: "Daily Stretch Challenge", points: 25)
                ChallengeCard(title: "Team Breathwork Goal", points: 50)
                
                Text("Leaderboards")
                    .font(.headline)
                    .foregroundColor(.sereneWhite)
                
                // Placeholder leaderboard
                Text("1. You - 250 pts")
                    .foregroundColor(.sereneWhite)
            }
            .padding()
            .background(LinearGradient.nightSkyGradient.ignoresSafeArea())
            .navigationTitle("Challenges")
        }
    }
}

struct ChallengeCard: View { // Renamed for consistency
    let title: String
    let points: Int
    
    var body: some View {
        HStack {
            Text(title)
                .font(.subheadline.bold())
                .foregroundColor(.sereneWhite)
            Spacer()
            Text("+\(points) pts")
                .font(.caption.bold())
                .foregroundColor(.havelockBlue)
        }
        .padding()
        .background(Color.cloudBurst.opacity(0.6))
        .cornerRadius(12)
    }
}
