# PlayHub

PlayHub is a SwiftUI-based mobile gaming application that contains 3 mini games in one app. The application allows users to play games, save scores, view statistics, track game locations, receive notifications, and manage their player profile.


# Features
##Tap Frenzy
- Fast tapping challenge game.
- Tracks player score, time and save results.

##Light It Up
- Grid Matrix based lighting game.
- require fast tapping for higher score.

##Quiz Rush
- Trivia-based quiz game.
- Calculates final score based on correct answers and save results.


# Application Features
## Home Screen
- Displays available games.
- Provides navigation to each game.

## Statistics
- Displays player's game history.
- Shows highest scores using charts.

## Map
- Saves the location where games were played.
- Displays saved game locations using map pins.

## Player Profile
- Displays player information.


## Settings
Includes:Notification controls, Dark mode,Reset scores, About section

## Notifications
- Sends game notifications to the user.

## Share Score
- Allows users to share their game scores.


# Project Architecture

PlayHubApp
├── App
│ └── Application entry point
│
├── Models
│ ├── GameSession.swift
│ ├── GameMode.swift
│ ├── TriviaQuestion.swift
│ └── PlayerProfile.swift
│
├── ViewModels
│ ├── TapFrenzyVM.swift
│ ├── LightItUpVM.swift
│ ├── QuizRushVM.swift
│ └── ProfileViewModel.swift
│
├── Services
│ ├── LocationService.swift
│ ├── NotificationService.swift
│ └── TriviaAPI.swift
│
└── Views
       ├── Tabs
       ├── Games
       └── Shared


# Data Storage
- UserDefaults for saving game sessions.
- ObservableObject for sharing application data.
- EnvironmentObject for passing shared data between views.


# Technologies Used
- Swift
- SwiftUI
- Xcode
- MapKit
- Charts Framework
- UserDefaults
- Notification Framework


# How To Run
1. Open the project in Xcode.
2. Select an iOS simulator or physical device.
3. Press Run button.
4. Select a game from the Home screen.
