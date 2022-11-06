//
//  ContentView.swift
//  MultiWindowApp
//
//  Created by Michele Manniello on 06/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NewTabView(isRootView: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
