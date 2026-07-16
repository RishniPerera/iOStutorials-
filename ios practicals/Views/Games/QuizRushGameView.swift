//
//  QuizRushView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-01.
//

import SwiftUI

struct QuizRushView: View {

    @StateObject private var viewModel = QuizViewModel()
    @EnvironmentObject var gameSession: GameSession
    @EnvironmentObject var locationService: LocationService

    var body: some View {
     
     NavigationStack {

        ZStack {
          LinearGradient(
            colors: [.blue, .purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            .ignoresSafeArea()

            Group {
            switch viewModel.state {
                case .loading:

                    VStack(spacing: 20) {

                        ProgressView()
                            .scaleEffect(2)
                        Text("Loading Questions...")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white) }

                case .loaded:
                if viewModel.quizFinished {

                VStack(spacing: 25) {

                Image(systemName: "trophy.fill")
                    .font(.system(size: 70))
                    .foregroundStyle(.yellow)

                Text("Quiz Completed!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                Text("Final Score")
                    .font(.headline)
                    .foregroundColor(.white)

                Text("\(viewModel.score)")
                    .font(.system(size: 55))
                    .bold()
                    .foregroundColor(.yellow)
                ScoreBadge(score: viewModel.score)

        ShareLink(
            item: "Hi! I scored \(viewModel.score) in Quiz Rush!") {

            Label("Share Score",
            systemImage: "square.and.arrow.up")
            .frame(width: 220,height: 50)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(15)}

            Button {
                Task {
                await viewModel.loadQuestions()}

                } label: {
                Label( "Play Again",systemImage: "arrow.clockwise")
                .frame(width:220,height:50)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(15) }
                }
                .padding()
                .onAppear {

                gameSession.saveScore(
                 gameName: "Quiz Rush",
                 score: viewModel.score,
                 latitude: locationService.latitude ?? 6.9271,
                 longitude: locationService.longitude ?? 79.8612)
                 } }

            else if let question = viewModel.currentQuestion {

            VStack(spacing: 25) {
              Text("Quiz Rush")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)

            HStack(spacing:15) {

            infoCard(title: "Score",value: "\(viewModel.score)",icon: "star.fill")

            infoCard(title: "Streak",value: "\(viewModel.streak)",icon: "flame.fill")

            infoCard(title: "Question",value: "\(viewModel.currentQuestionIndex + 1)/\(viewModel.questions.count)",icon: "questionmark.circle.fill")

            }
                

            VStack {

            Text(question.question)
                .font(.title3)
                .bold()
                .multilineTextAlignment(.center)
                .padding()}
                .frame(maxWidth:.infinity)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius:8)

                ForEach(question.allAnswers,id:\.self) { answer in

                Button {
                    viewModel.answerSelected(answer)

                    } label: {
                    Text(answer)
                        .font(.headline)
                        .frame(maxWidth:.infinity)
                        .padding()
                        .background(
                    LinearGradient(
                        colors:[.blue,.cyan],
                        startPoint:.leading,
                        endPoint:.trailing)
                        )
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius:5)}
                         }

                     Spacer()
                         }
                    .padding()}

                    case .failed(let message):

                    VStack(spacing:20) {
                       Image(systemName:"wifi.exclamationmark")
                          .font(.system(size:70))
                          .foregroundColor(.red)

                        Text(message)
                          .multilineTextAlignment(.center)
                          .foregroundColor(.white)

                        Button("Retry") {
                          Task {
                            await viewModel.loadQuestions()}
                                }
                                .buttonStyle(.borderedProminent)
                                }
                            }
                        } }
                    .navigationBarTitleDisplayMode(.inline)
                }

                .task {

                    await viewModel.loadQuestions()

                }
            }}

        extension QuizRushView {

            func infoCard(
                title:String,
                value:String,
                icon:String
            ) -> some View {

                VStack(spacing:8) {

                    Image(systemName: icon)
                        .foregroundColor(.yellow)

                    Text(value)
                        .font(.title2)
                        .bold()

                    Text(title)
                        .font(.caption)

                }
                .foregroundColor(.white)
                .frame(maxWidth:.infinity)
                .padding()
                .background(.white.opacity(0.15))
                .cornerRadius(15)

            }
        }
        #Preview {

            QuizRushView()
                .environmentObject(GameSession())
                .environmentObject(LocationService())

        }
