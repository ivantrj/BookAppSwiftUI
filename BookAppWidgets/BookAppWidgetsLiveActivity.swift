//
//  BookAppWidgetsLiveActivity.swift
//  BookAppWidgets
//
//  Created by Maros Petrus on 24/03/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct BookAppWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct BookAppWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: BookAppWidgetsAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension BookAppWidgetsAttributes {
    fileprivate static var preview: BookAppWidgetsAttributes {
        BookAppWidgetsAttributes(name: "World")
    }
}

extension BookAppWidgetsAttributes.ContentState {
    fileprivate static var smiley: BookAppWidgetsAttributes.ContentState {
        BookAppWidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: BookAppWidgetsAttributes.ContentState {
         BookAppWidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: BookAppWidgetsAttributes.preview) {
   BookAppWidgetsLiveActivity()
} contentStates: {
    BookAppWidgetsAttributes.ContentState.smiley
    BookAppWidgetsAttributes.ContentState.starEyes
}
