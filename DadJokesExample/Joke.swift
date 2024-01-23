//
//  Joke.swift
//  DadJokesExample
//
//  Created by Dinh Quang Hieu on 22/01/2024.
//

import Foundation

struct Joke: Identifiable, Hashable {
  var id: Int
  let content: String
}

let jokes: [Joke] = [
  Joke(id: 1, content: "My manager told me to have a good day.\n\nSo I didn't go into work."),
  Joke(id: 2, content: "What do kids play when they have nothing else to do?\n\nBored games."),
  Joke(id: 3, content: "When does Friday come before Thursday?\n\nIn the dictionary."),
  Joke(id: 4, content: "Why don't scientists trust atoms?\n\nBecause they make up everything."),
  Joke(id: 5, content: "I told my wife she should embrace her mistakes.\n\nShe gave me a hug"),
]
