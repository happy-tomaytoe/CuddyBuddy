//
//  HomeView.swift
//  MagpantayCuddyBuddy
//
//  Created by Justine Lydia Magpantay on 4/14/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
   
    @Query private var foodItems: [Food]
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var searchText: String = ""
    
    var searchResults: [String: [Food]] {
        let filtered = searchText.isEmpty ? foodItems : foodItems.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
        return Dictionary(grouping: filtered, by: { $0.type })
    }
    
    @State var editMode: Bool = false
    private var groupedFoodItems: [String: [Food]] {
           Dictionary(grouping: foodItems, by: { $0.type })
       }
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(searchResults.keys.sorted(), id: \.self) { type in
                    Section(header: Text(type).font(.headline)) {
                        ForEach(searchResults[type] ?? []) { item in
                            NavigationLink (value: item) {
                                FoodItemCellView(item: item)
                            }
                        }
                        .onDelete(perform: deleteFood)
                    }
                }
            }
            .toolbar {
                HomeToolbarView()
            }
            .searchable(text: $searchText, prompt: "What's in my Cuddy?")
            .navigationDestination(for: Food.self) { food in
                EditFoodView(foodItem: food)
        }
        
        }
        
    }
    
    func deleteFood(_ indexSet: IndexSet) {
        for i in indexSet {
            let food = foodItems[i]
            modelContext.delete(food)
        }
        saveFood()
    }
    
    func saveFood() {
        do {
            try modelContext.save()
        } catch {
            print("Buddy could not save the cuddy.")
        }
    }
    
    
    
}



#Preview {
    HomeView()
        .navigationBarBackButtonHidden(true)
}
