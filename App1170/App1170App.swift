import SwiftUI

@main
struct App1170App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Source())
                .preferredColorScheme(.dark)
        }
    }
}
