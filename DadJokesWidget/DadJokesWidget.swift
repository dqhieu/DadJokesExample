//
//  DadJokesWidget.swift
//  DadJokesWidget
//
//  Created by Dinh Quang Hieu on 23/01/2024.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: .now, joke: jokes.first!)
  }

  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
    let entry = SimpleEntry(date: .now, joke: jokes.first!)
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    var entries: [SimpleEntry] = []

    // Generate a timeline consisting of five entries an hour apart, starting from the current date.
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = SimpleEntry(date: entryDate, joke: jokes.randomElement()!)
      entries.append(entry)
    }

    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let joke: Joke
}

struct DadJokesWidgetEntryView : View {

  var entry: Provider.Entry

  var jokeDeeplink: URL? {
    URL(string: "dadjokes://open?id=\(entry.joke.id)")
  }

  var body: some View {
    VStack {
      Text(entry.joke.content)
    }
    .widgetURL(jokeDeeplink)
  }
}

struct DadJokesWidget: Widget {
  let kind: String = "DadJokesWidget"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      if #available(iOS 17.0, *) {
        DadJokesWidgetEntryView(entry: entry)
          .containerBackground(.fill.tertiary, for: .widget)
      } else {
        DadJokesWidgetEntryView(entry: entry)
          .padding()
          .background()
      }
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}

#Preview(as: .systemSmall) {
  DadJokesWidget()
} timeline: {
  SimpleEntry(date: .now, joke: jokes.first!)
  SimpleEntry(date: .now, joke: jokes.last!)
}
