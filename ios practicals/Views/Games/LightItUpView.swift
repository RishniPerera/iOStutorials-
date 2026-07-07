import SwiftUI
import Combine

struct LightItUpView: View {
    @StateObject private var game = LightItUpVM()
    @EnvironmentObject var gameSession: GameSession
    
    // game timer
    let gameTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private var gridColumns: [GridItem] {
        // Level 1 has 3 columns, Level 2(2 columns), Level 3 & 4 are 3 columns
        Array(repeating: GridItem(.flexible(), spacing: 15), count: game.currentLevel.columns)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // score and timer section
            HStack {
                Text("Score: \(game.score)")
                    .font(.title2).bold()
                Spacer()
                Text(" \(game.timeRemaining)s")
                    .font(.title2).bold()
                    .foregroundColor(game.timeRemaining <= 10 ? .red : .primary)
            }
            .padding(.horizontal)
            
            
            //current level
            Text(game.currentLevel.rawValue)
                .font(.headline)
                .foregroundColor(game.currentLevel.glowColor)
            Spacer()
            
            if game.isGameActive {
                // Game Grid Matrix
                LazyVGrid(columns: gridColumns, spacing: 15) {
                    ForEach(0..<game.currentLevel.totalCards, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(game.litCardIndex == index ? game.currentLevel.glowColor : Color(.systemGray4))
                            .frame(height: 100)
                            .shadow(color: game.litCardIndex == index ? game.currentLevel.glowColor.opacity(0.5) : .clear, radius: 8)
                            .onTapGesture {
                                game.tapCard(index)
                            }
                    }
                }
                .padding()
                
            } else {
                // Game Over Screen
                VStack(spacing: 15) {
                    Text(game.timeRemaining == 0 ? "Game Over!" : "Light It Up")
                        .font(.largeTitle).bold()
                    
                    Text("High Score: \(game.highScore)")
                        .font(.headline)
                    
                    Button{game.startGame ()}
                    label: {
                        Text(game.timeRemaining == 0 ? "Play Again" : "Start Game")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .onAppear {


                        gameSession.saveScore(
                            gameName: "Light It Up",
                            score: game.score
                        )


                    }


                }

            Spacer()
            
        }
        .padding()
        .navigationTitle(" Light It Up")
        
        // game timer
        .onReceive(gameTimer) { _ in
            game.updateTimer()
        }}}
            
#Preview {
    LightItUpView()
        .environmentObject(GameSession())
}
