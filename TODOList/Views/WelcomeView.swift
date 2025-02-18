//
//  WelcomeView.swift
//  TODOList
//
//  Created by Mark on 18.02.2025.
//

import SwiftUI

struct PageInfo: Identifiable {
    let id = UUID()
    let label: String
    let text: String
    let image: ImageResource
}

let pages = [
    PageInfo(label: "Welcome to TODO App", text: "Plan your tasks easily and effectively. Our app will help you keep everything under control and achieve your goals without stress.", image: .imageOne),
    PageInfo(label: "Easy task management", text: "Create, edit and mark completed tasks. Group them by category and priority so you don't miss anything.", image: .imageTwo),
    PageInfo(label: "Don't forget what's important anymore!", text: "Receive task reminders and sync your list across all devices. Start planning productively now!", image: .imageThree)
]

struct WelcomeView: View {
    @Binding var isWelcomeSheetShowing: Bool
    
    var body: some View {
        VStack {
            TabView {
                ForEach(pages) { page in
                    VStack {
                        Text(page.label)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        Text(page.text)
                            .fontWeight(.medium)
                            .padding()
                        
                        Image(page.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                    }
                }
            }
            Button {
                isWelcomeSheetShowing.toggle()
            } label: {
                Text("OK")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .interactiveDismissDisabled()
        .tabViewStyle(.page)
        .onAppear {
            UIPageControl.appearance().currentPageIndicatorTintColor = .label
            UIPageControl.appearance().pageIndicatorTintColor = .systemGray
        }
    }
}

#Preview {
    WelcomeView(isWelcomeSheetShowing: .constant(true))
}
