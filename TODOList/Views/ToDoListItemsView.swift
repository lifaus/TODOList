//
//  ToDoListItemsView.swift
//  TODOList
//
//  Created by Mark on 18.02.2025.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?
                      "checkmark.circle.fill" : "circle")
                .foregroundColor(Color.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemsView(item: .init(id: "123",
                                  title: "test",
                                  dueDate: Date().timeIntervalSince1970,
                                  createdDate: Date().timeIntervalSince1970,
                                  isDone: true))
}
