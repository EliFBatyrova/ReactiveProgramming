//
//  ContentView.swift
//  ReactiveProgramming
//
//  Created by underq  on 06.11.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = UserListViewModel()
    
    var body: some View {
        List(viewModel.users) { user in
            HStack {
                VStack(alignment: .leading) {
                    Text(user.name).font(.headline)
                    Text(user.username).font(.title)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
