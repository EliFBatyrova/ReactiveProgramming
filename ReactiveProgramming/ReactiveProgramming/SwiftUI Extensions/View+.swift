//
//  View+.swift
//  ReactiveProgramming
//
//  Created by underq  on 08.11.2020.
//

import SwiftUI

extension View {
    
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        
        var actionPerformed = false
        
        return self.onAppear {
            
            guard !actionPerformed else {
                return
            }
            
            actionPerformed = true
            action?()
        }
    }
}
