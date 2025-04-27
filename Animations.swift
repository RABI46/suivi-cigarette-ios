import SwiftUI

struct NeonButton: View {
    var label: String
    var action: () -> Void

    @State private var glowing = false

    var body: some View {
        Button(action: action) {
            Text(label)
                .padding()
                .background(glowing ? Color.blue : Color.purple)
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(color: glowing ? .blue : .purple, radius: glowing ? 20 : 10)
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                glowing.toggle()
            }
        }
    }
}
