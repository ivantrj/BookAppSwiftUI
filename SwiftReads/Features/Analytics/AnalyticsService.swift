//
//  AnalyticsService.swift
//  SwiftReads
//
//  Created by Ivan Trajanovski.
//

import Mixpanel

class AnalyticsService {
    
    static let shared = AnalyticsService()

    private init() {}

    func log(event: AnalyticsEvent, properties: [AnalyticsPropertyKey: Any]? = nil) {
        Mixpanel.mainInstance().track(
            event: event.rawValue, properties: Dictionary(
                uniqueKeysWithValues: (properties ?? [:]).compactMap({ key, value in
                    guard let value = value as? MixpanelType else { return nil }
                    return (key.rawValue, value)
                })
            )
        )
    }
}
