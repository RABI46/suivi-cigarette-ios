import SwiftUI

struct ContentView: View {
    @AppStorage("cigaretteCount") private var cigaretteCount = 0
    @AppStorage("lastSmokeTime") private var lastSmokeTime = Date().timeIntervalSince1970
    @State private var adviceMessage: String = "Bienvenue dans le coaching IA !"

    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .purple, .blue], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("🚬 Sevrage Tabagique")
                    .font(.largeTitle)
                    .foregroundColor(.cyan)
                    .shadow(color: .cyan, radius: 10)

                Text("🔥 Cigarettes fumées aujourd'hui : \(cigaretteCount)")
                    .font(.title)
                    .foregroundColor(.white)

                Text("⏳ Dernière cigarette : \(timeSinceLast())")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                NeonButton(label: "J'ai fumé") {
                    cigaretteCount += 1
                    lastSmokeTime = Date().timeIntervalSince1970
                    NotificationManager().sendEncouragement()
                }

                NavigationLink("💡 Coaching IA", destination: CoachingView())
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
                    .foregroundColor(.white)

                Button(action: {
                    cigaretteCount = 0
                }) {
                    Text("🔄 Réinitialiser")
                        .padding()
                        .background(Color.red)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }

    func timeSinceLast() -> String {
        let interval = Date().timeIntervalSince1970 - lastSmokeTime
        let minutes = Int(interval / 60)
        return "\(minutes) minutes"
    }
}
