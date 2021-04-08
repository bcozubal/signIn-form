//
//  SignInFormApp.swift
//  SignInForm
//
//  Created by Barış Özübal on 25.02.2021.
//

import SwiftUI

@main
struct SignInFormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
        }
    }
}
