//
//  AnalyticsManager.swift
//  ReactiveProgramming
//
//  Created by Enoxus on 07.11.2020.
//

import FirebaseAnalytics

protocol AnalyticsManagerProtocol {
    func logEvent(_ name: String, params: [String: Any]?)
}

final class AnalyticsManager: AnalyticsManagerProtocol {
    func logEvent(_ name: String, params: [String : Any]?) {
        Analytics.logEvent(name, parameters: params)
    }
}
