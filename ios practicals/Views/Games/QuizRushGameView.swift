//
//  QuizRushView.swift
//  ios practicals
//
//  Created by Student 1 on 2026-07-01.
//

import SwiftUI

struct QuizRushView: View {

    @StateObject private var viewModel = QuizViewModel()

    var body: some View {

        NavigationStack {

            Group {

                switch viewModel.state {
                case .loading:

                    VStack(spacing: 20) {

                        ProgressView()

                        Text("Loading Questions...")
                            .font(.headline)
                    }
                case .loaded:

                    if viewModel.quizFinished {

                        VStack(spacing: 20) {

                            Text("Quiz Finished!")
                                .font(.largeTitle)
                                .bold()

                            Text("Final Score")

                            Text("\(viewModel.score)")
                                .font(.system(size: 50))
                                .bold()
                        }

                    } else if let question = viewModel.currentQuestion {

                        VStack(spacing: 20) {

                            Text("Question \(viewModel.currentQuestionIndex + 1) of \(viewModel.questions.count)")
                                .font(.headline)

                            Text("Score: \(viewModel.score)")
                                .font(.headline)

                            Text("Streak:  \(viewModel.streak)")
                                .font(.headline)

                            Divider()

                            Text(question.question)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .padding()

                            ForEach(question.allAnswers, id: \.self) { answer in

                                Button {

                                    viewModel.answerSelected(answer)

                                } label: {

                                    Text(answer)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)

                                }

                            }

                            Spacer()

                        }
                        .padding()

                    }


                case .failed(let message):

                    VStack(spacing: 20) {

                        Image(systemName: "wifi.exclamationmark")
                            .font(.system(size: 60))
                            .foregroundColor(.red)

                        Text(message)
                            .multilineTextAlignment(.center)

                        Button("Retry") {

                            Task {
                                await viewModel.loadQuestions()
                            }

                        }
                        .buttonStyle(.borderedProminent)
                    }
                }

            }
            .navigationTitle("Quiz Rush")
        }

        .task {

            await viewModel.loadQuestions()

        }

    }

}

#Preview {
    QuizRushView()
}
