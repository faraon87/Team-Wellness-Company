import SwiftUI

// CoachingView.swift
// Ports coaching components: Booking system, group sessions.

struct CoachingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Text("Personalized Coaching")
                    .font(.title.bold())
                    .foregroundColor(.sereneWhite)
                
                NavigationLink(destination: BookingView(coach: "Chris - Recovery Specialist")) {
                    Text("Book with Chris")
                        .font(.headline)
                        .foregroundColor(.havelockBlue)
                }
                
                NavigationLink(destination: BookingView(coach: "Fran - Wellness Strategy")) {
                    Text("Book with Fran")
                        .font(.headline)
                        .foregroundColor(.havelockBlue)
                }
                
                Text("Group Sessions")
                    .font(.headline)
                    .foregroundColor(.sereneWhite)
                
                // Placeholder list of sessions
                Text("Morning Stretch & Flow - Register")
                    .foregroundColor(.sereneWhite)
            }
            .padding()
            .background(LinearGradient.forestGradient.ignoresSafeArea())
            .navigationTitle("Coaching")
        }
    }
}

struct BookingView: View {
    let coach: String
    
    var body: some View {
        VStack {
            Text("Booking with \(coach)")
                .font(.title.bold())
                .foregroundColor(.sereneWhite)
            
            // Integrate calendar (placeholder for Calendly web view or native picker)
            DatePicker("Select Time", selection: .constant(Date()))
                .datePickerStyle(.graphical)
                .accentColor(.havelockBlue)
        }
        .padding()
        .background(LinearGradient.oceanGradient.ignoresSafeArea())
    }
}
