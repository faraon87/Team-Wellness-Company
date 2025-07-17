import SwiftUI

// SettingsView.swift
// Ports settings components: Profile, integrations.

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Profile").font(.headline).foregroundColor(.havelockBlue)) {
                    Text("Edit Profile Details")
                        .foregroundColor(.sereneWhite)
                }
                
                Section(header: Text("Device Sync").font(.headline).foregroundColor(.havelockBlue)) {
                    Toggle("Apple Health", isOn: .constant(true))
                        .toggleStyle(SwitchToggleStyle(tint: .havelockBlue))
                    Toggle("Fitbit", isOn: .constant(false))
                        .toggleStyle(SwitchToggleStyle(tint: .havelockBlue))
                }
                
                Section(header: Text("Notifications").font(.headline).foregroundColor(.havelockBlue)) {
                    Toggle("Daily Reminders", isOn: .constant(true))
                        .toggleStyle(SwitchToggleStyle(tint: .havelockBlue))
                }
                
                Section(header: Text("Support").font(.headline).foregroundColor(.havelockBlue)) {
                    Text("FAQ")
                        .foregroundColor(.havelockBlue)
                    Text("Contact Support")
                        .foregroundColor(.havelockBlue)
                }
            }
            .listStyle(.insetGrouped)
            .background(LinearGradient.forestGradient.ignoresSafeArea())
            .navigationTitle("Settings")
        }
    }
}
