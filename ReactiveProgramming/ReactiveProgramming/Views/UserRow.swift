//
//  UserRow.swift
//  ReactiveProgramming
//
//  Created by underq  on 08.11.2020.
//

import SwiftUI

struct UserRow: View {

    var user: User

    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name).font(.headline)
            Text(user.username).font(.body)
            Text(user.email).font(.body)
            Text(user.address.city).font(.body)
            Text(user.company.name).font(.body)
        }
    }
}
