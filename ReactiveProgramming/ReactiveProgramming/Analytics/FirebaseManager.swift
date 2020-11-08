//
//  FirebaseManager.swift
//  ReactiveProgramming
//
//  Created by underq  on 08.11.2020.
//

import FirebaseAnalytics

protocol FirebaseManagerProtocol: class {

    func logOpenUsersListEvent()
    func logOpenDetailUserViewEvent()
    func logAddedUserToFriendsEvent()
}

class FirebaseManager: NSObject, FirebaseManagerProtocol {

    //MARK:- Singletone Instance Configuration

    static let shared: FirebaseManager = {

        let instance = FirebaseManager()

        return instance
    }()

    private override init() {
        Analytics.setUserID("11111")
    }

    public func logOpenUsersListEvent() {

        let eventText = "users_list_opened"

        Analytics.logEvent(eventText, parameters: nil)
    }

    public func logOpenDetailUserViewEvent() {

        let eventText = "detail_user_view_opened"

        Analytics.logEvent(eventText, parameters: nil)
    }

    public func logAddedUserToFriendsEvent() {
        
        let eventText = "user_added_to_friends"

        Analytics.setUserProperty("yes", forName: "isUserFriendly")
        Analytics.logEvent(eventText, parameters: nil)
    }
}

//MARK:- Extra copy instance protection

extension FirebaseManager: NSCopying {

    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
