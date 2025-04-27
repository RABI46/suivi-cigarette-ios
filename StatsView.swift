import SwiftUI
import Charts

struct StatsView: View {
    @AppStorage("cigaretteHistory") private var cigaretteHistory: [Int] = Array(repeating: 0, count: 7)

    var body: some View {
        VStack {
            Text("📊 Suivi Hebdomadaire")
                .font(.title)
                .foregroundColor(.cyan)
                .shadow(color: .cyan, radius: 10)

            Chart {
                ForEach(cigaretteHistory.indices, id: \.self) { index in
                    BarMark(
                        x: .value("Jour", "J\(index + 1)"),
                        y: .value("Cigarettes", cigaretteHistory[index])
                    )
                    .foregroundStyle(.purple)
                }
            }
            .frame(height: 250)
            .padding()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
