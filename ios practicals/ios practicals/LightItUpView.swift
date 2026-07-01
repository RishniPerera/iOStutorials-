import SwiftUI
import Combine

struct LightItUpView: View {
    @State private var score = 0
    @State private var timeRemaining = 60
    @State private var isGameActive = false
    @State private var litCardIndex: Int? = nil
    
    // high score
    @AppStorage("lightItUpHighScore") private var highScore = 0
    
    // Standard 1-second timer for the game clock
    let gameTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // properties to calculate difficulty based on slides
    private var currentLevel: Int {
        if timeRemaining <= 15 { return 4 }      // 45s - End
        else if timeRemaining <= 30 { return 3 } // 30-45s
        else if timeRemaining <= 45 { return 2 } // 15-30s
        else { return 1 }                        // 0-15s
    }
    private var levelEnum: Level {
            switch currentLevel {
            case 1: return .L1
            case 2: return .L2
            case 3: return .L3
            default: return .L4
            }
        }
    private var totalCards: Int {
        switch currentLevel {
        case 1: return 3   // 3 cards (row)
        case 2: return 4   // 4 cards
        case 3: return 6   // 6 cards (2x3)
        default: return 9  // 9 cards (3x3)
        }
    }
    
    private var gridColumns: [GridItem] {
        // Level 1 is a horizontal row (3 columns), Level 2 is 2x2 (2 columns), Level 3 & 4 are 3 columns
        let columnCount = currentLevel == 2 ? 2 : 3
        return Array(repeating: GridItem(.flexible(), spacing: 15), count: columnCount)
    }

    var body: some View {
        VStack(spacing: 20) {
            // Stats Panel
            HStack {
                Text("Score: \(score)")
                    .font(.title2).bold()
                Spacer()
                Text("⏳ \(timeRemaining)s")
                    .font(.title2).bold()
                    .foregroundColor(timeRemaining <= 10 ? .red : .primary)
            }
            .padding(.horizontal)
            
            
            
            Text(levelEnum.rawValue)
                            .font(.headline)
                            .foregroundColor(levelEnum.glowColor)
            Spacer()
            
            if isGameActive {
                // Game Grid Matrix
                LazyVGrid(columns: gridColumns, spacing: 15) {
                    ForEach(0..<totalCards, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(litCardIndex == index ? levelEnum.glowColor : Color(.systemGray4))
                            .frame(height: 100)
                            .shadow(color: litCardIndex == index ? levelEnum.glowColor.opacity(0.5) : .clear, radius: 8)
                            .onTapGesture {
                            handleTap(on: index)
                            }
                    }
                }
                .padding()
            } else {
                // Start / Game Over Screen
                VStack(spacing: 15) {
                    Text(timeRemaining == 0 ? "Game Over! 🏁" : "Light It Up")
                        .font(.largeTitle).bold()
                    
                    Text("High Score: \(highScore)")
                        .font(.headline)
                    
                    Button(action: startGame) {
                        Text(timeRemaining == 0 ? "Play Again" : "Start Game")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 180)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
            
            Spacer()
        }
        .navigationTitle(" Light It Up")
        Text("🟩🟨🟧🟥")
        // Listens to the 1-second system clock tick
        .onReceive(gameTimer) { _ in
            if isGameActive {
                if timeRemaining > 0 {
                    timeRemaining -= 1
                    
                    // interval check: randomly cycle cards as the clock ticks
                    // At lower times (higher levels), we can optionally cycle it faster or change layout
                    if Int.random(in: 1...2) == 1 || litCardIndex == nil {
                        cycleLitCard()
                    }
                } else {
                    endGame()
                }
            }
        }
    }
    func startGame() {
        score = 0
        timeRemaining = 60
        isGameActive = true
        cycleLitCard()
    }
    
    func cycleLitCard() {
        // Pick a completely random index out of the current total card count
        litCardIndex = Int.random(in: 0..<totalCards)
    }
    
    func handleTap(on index: Int) {
        if index == litCardIndex {
            score += 10 // Correct Tap
            cycleLitCard() // Instantly hop to the next spot
        } else {
            score = max(0, score - 5) // Simple score penalty option
        }
    }
    
    func endGame() {
        isGameActive = false
        litCardIndex = nil
        if score > highScore {
            highScore = score // Persist score automatically
        }
    }
}

#Preview {
    LightItUpView()
}
