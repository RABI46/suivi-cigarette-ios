import SwiftUI
import Foundation

struct AIChatView: View {
    @State private var userMessage: String = ""
    @State private var aiResponse: String = "Pose-moi une question sur ton sevrage !"

    var body: some View {
        VStack {
            Text("🤖 Assistant IA OpenAI")
                .font(.title)
                .foregroundColor(.cyan)

            Text(aiResponse)
                .padding()
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)

            TextField("Écris ton message", text: $userMessage)
                .padding()
                .background(Color.gray.opacity(0.3))

            Button(action: {
                fetchAIResponse()
            }) {
                Text("💡 Demander à l'IA")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    func fetchAIResponse() {
        let apiKey = "TON_API_KEY"
        let prompt = userMessage

        guard let url = URL(string: "https://api.openai.com/v1/chat/completions") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = ["model": "gpt-4", "messages": [["role": "user", "content": prompt]]]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data, let json = try? JSONDecoder().decode([String: String].self, from: data),
               let response = json["choices"]?[0]["message"]["content"] {
                DispatchQueue.main.async {
                    aiResponse = response
                }
            }
        }.resume()
    }
}
