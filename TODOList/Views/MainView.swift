//
//  ContentView.swift
//  TODOList
//
//  Created by Mark on 18.02.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @AppStorage("isWelcomeSheetShowing") var isWelcomeSheetShowing = true
    
    var body: some View {
        VStack {
            if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
                accountView
            } else {
                LoginView()
            }
        }
        .sheet(isPresented: $isWelcomeSheetShowing) {
            WelcomeView(isWelcomeSheetShowing: $isWelcomeSheetShowing)
        }
        
        
    }
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage:
                            "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
