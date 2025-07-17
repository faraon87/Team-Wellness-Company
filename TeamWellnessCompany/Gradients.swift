import SwiftUI

extension LinearGradient {
    static let forestGradient = LinearGradient(gradient: Gradient(colors: [.cloudBurst, Color.green.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
    static let oceanGradient = LinearGradient(gradient: Gradient(colors: [.cloudBurst, .havelockBlue.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
    static let nightSkyGradient = LinearGradient(gradient: Gradient(colors: [.cloudBurst, .black]), startPoint: .top, endPoint: .bottom)
}
