//
//  JokeListView.swift
//  DadJokesExample
//
//  Created by Dinh Quang Hieu on 22/01/2024.
//

import SwiftUI

enum Screen: Hashable {
  case detail(Joke)
}

struct JokeListView: View {

  @State private var presentedScreen: [Screen] = []

  var body: some View {
    NavigationStack(path: $presentedScreen) {
      List(jokes) { joke in
        Text(joke.content)
          .onTapGesture {
            presentedScreen = [.detail(joke)]
          }
      }
      .navigationDestination(for: Screen.self) { screen in
        switch screen {
        case .detail(let joke):
          JokeDetailView(joke: joke)
        }
      }
    }
    .onOpenURL { url in
      handleOpenURL(url)
    }
  }

  private func handleOpenURL(_ url: URL) {
    if let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
       components.scheme == "dadjokes",
       let jokeId = components.queryItems?.first(where: { $0.name == "id"} )?.value,
       let joke = jokes.first(where: { $0.id == Int(jokeId) }) {
      presentedScreen = [.detail(joke)]
    }
  }
}

#Preview {
  JokeListView()
}
