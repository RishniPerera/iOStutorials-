import SwiftUI

struct LightItUpView: View {

    @State private var score = 0
    @State private var timeRemaining = 60

    var body: some View {
        VStack(spacing: 20) {

            Text("⚡ Light It Up ⚡ ")
                .font(.system(size: 40, weight: .heavy))
                .font(.largeTitle)
                .bold()

            Text("Score: \(score)")
                .font(.title2)

            Text("Time: \(timeRemaining)")
                .font(.title2)

            Spacer()

            Text("Game will go here")
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    LightItUpView()
}
