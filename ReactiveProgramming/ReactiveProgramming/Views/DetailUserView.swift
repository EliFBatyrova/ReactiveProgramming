//
//  DetailUserView.swift
//  ReactiveProgramming
//
//  Created by underq  on 08.11.2020.
//

import SwiftUI

struct DetailUserView: View {

    var user: User

    var body: some View {
        VStack {
            Text(user.name).font(.title)
            Button(action: {
                FirebaseManager.shared.logAddedUserToFriendsEvent()
            }) {
                Text("Add to friends")
            }
        }.onLoad(perform: {
            FirebaseManager.shared.logOpenDetailUserViewEvent()
        })
    }
}
