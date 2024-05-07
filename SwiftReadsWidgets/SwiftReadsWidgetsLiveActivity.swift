//
//  SwiftReadsWidgetsLiveActivity.swift
//  SwiftReadsWidgets
//
//  Created by Maros Petrus on 24/03/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct SwiftReadsWidgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct SwiftReadsWidgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: SwiftReadsWidgetsAttributes.self) { context in
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

extension SwiftReadsWidgetsAttributes {
    fileprivate static var preview: SwiftReadsWidgetsAttributes {
        SwiftReadsWidgetsAttributes(name: "World")
    }
}

extension SwiftReadsWidgetsAttributes.ContentState {
    fileprivate static var smiley: SwiftReadsWidgetsAttributes.ContentState {
        SwiftReadsWidgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: SwiftReadsWidgetsAttributes.ContentState {
         SwiftReadsWidgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: SwiftReadsWidgetsAttributes.preview) {
   SwiftReadsWidgetsLiveActivity()
} contentStates: {
    SwiftReadsWidgetsAttributes.ContentState.smiley
    SwiftReadsWidgetsAttributes.ContentState.starEyes
}
