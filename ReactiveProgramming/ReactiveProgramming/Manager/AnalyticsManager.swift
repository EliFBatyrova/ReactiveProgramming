//
//  AnalyticsManager.swift
//  ReactiveProgramming
//
//  Created by Евгений on 12.11.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import FirebaseAnalytics
 
protocol AnalyticsManager {
    func reportEvent(with message: String, parameters: [String : Any]?)
    func setUserProperty(name: String)
}

class AnalyticsManagerImpl: AnalyticsManager {
    
    private let favouriteNameUserPropertyName = "favourite_name"
    private let luckyNumberAtTheMomentPropertyName = "moment_lucky_number"

    func reportEvent(with message: String, parameters: [String : Any]?) {
        Analytics.logEvent(message, parameters: parameters)
    }
    
    func setUserProperty(name: String) {
        Analytics.setUserProperty(name, forName: favouriteNameUserPropertyName)
    }

    init() {
        Analytics.setUserProperty("\(Int.random(in: 1...10))", forName: luckyNumberAtTheMomentPropertyName)
    }
}
