//
//  TodoListView.swift
//  TODOList
//
//  Created by Mark on 18.02.2025.
//

import FirebaseFirestore
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        //users/<id>/todos/<entries>
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemsView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do list")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented:
                                $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    TodoListView(userId: "eyYn817YVRTvL8qfEXfnTrQIQwa2")
}
