//
//  JokeDetailView.swift
//  DadJokesExample
//
//  Created by Dinh Quang Hieu on 22/01/2024.
//

import SwiftUI

struct JokeDetailView: View {

  var joke: Joke

  var body: some View {
    Text(joke.content)
      .font(.title)
      .multilineTextAlignment(.center)
      .padding()
  }
}

#Preview {
  JokeDetailView(joke: jokes.first!)
}
