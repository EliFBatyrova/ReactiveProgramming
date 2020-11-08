//
//  ContentView.swift
//  ReactiveProgramming
//
//  Created by underq  on 06.11.2020.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel = UserListViewModel()
    
    private let navigationBarTitle = "Users"

    var body: some View {

        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: DetailUserView(user: user)) {
                    UserRow(user: user)
                }
            }
            .navigationBarTitle(navigationBarTitle)
        }.onLoad(perform: {
            FirebaseManager.shared.logOpenUsersListEvent()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
