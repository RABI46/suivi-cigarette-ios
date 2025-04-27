import SwiftUI

struct CoachingView: View {
    @State private var message: String = "Bienvenue dans le coaching IA !"

    var body: some View {
        VStack {
            Text("🤖 Coach IA")
                .font(.largeTitle)
                .foregroundColor(.cyan)

            Text(message)
                .padding()
                .foregroundColor(.white)
                .background(Color.black.opacity(0.6))

            NavigationLink("💬 Assistant IA", destination: AIChatView())
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
