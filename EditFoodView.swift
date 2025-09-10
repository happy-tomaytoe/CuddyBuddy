//
//  EditFoodView.swift
//  MagpantayCuddyBuddy
//
//  Created by Justine Lydia Magpantay on 4/29/25.
//

import SwiftUI
import InputStepper
import SwiftData

struct EditFoodView: View {
        @Environment(\.modelContext) var modelContext
        @Environment(\.dismiss) var dismiss
    //
    @Bindable var foodItem: Food
    @State private var goHome = false
    @State private var quantity: Float = 0
    //
    let foodTypes: [String] = ["Fruits", "Vegetables", "Meats", "Canned Goods", "Dairy", "Desserts", "Leftovers"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red,.init(red: 1.0, green: 0.25, blue: 0.25), .init(red: 1.0, green: 0.45, blue: 0.45),.init(red: 1.0, green: 0.45, blue: 0.45), .red]), startPoint: .top, endPoint: .bottom)
            
            Text("Edit Food")
                .font(.custom("Marker Felt", size: 56))
                .foregroundStyle(Color.white)
                .bold()
                .position(x: 200, y: 110)
            
            VStack (alignment:.leading, spacing: 70) {
                VStack(alignment:.leading, spacing: 6) { // Food name stack start
                    Text("  Food Name")
                        .bold()
                        .foregroundStyle(Color.white)
                        .font(.custom("AvenirNext-Medium", size: 24))
                    TextField("Enter food name", text: $foodItem.name)
                        .padding()
                        .background(Color.white.opacity(1))
                        .cornerRadius(20)
                        .frame(width: 370, height: 40)
                }// Food name stack end
                
                VStack(alignment:.leading, spacing: 6) { // Food type stack start
                    Text("Food Type: ")
                        .bold()
                        .foregroundStyle(Color.white)
                        .font(.custom("AvenirNext-Medium", size: 24))
                    Picker("food types", selection: $foodItem.type) {
                        ForEach(foodTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                    .padding()
                    .cornerRadius(20)
                    .frame(width: 370, height: 50)
                    .foregroundStyle(Color.white)
                    .background(Color.white.opacity(1))
                } // Food type stack end
                
                VStack(alignment:.leading, spacing: 6) {
                    Text("Food Quantity: ")
                        .bold()
                        .foregroundStyle(Color.white)
                        .font(.custom("AvenirNext-Medium", size: 24))
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 370, height: 50)
                            .foregroundStyle(Color.white)
                        HStack(alignment: .center, spacing: 25) {
                            InputStepper($quantity) {
                                MinusButton()
                                Value()
                                PlusButton()
                            }
                        }
                    }
                }
                
                HStack (spacing: 6) { // Food expiration stack start
                    Text("Expiration Date: ")
                        .bold()
                        .foregroundStyle(Color.white)
                        .font(.custom("AvenirNext-Medium", size: 24))
                    DatePicker("", selection: $foodItem.expirationDate, displayedComponents: [.date])
                        .frame(width: 130, height: 40, alignment: .center)
                        .background(Color.white.opacity(1))
                } // Food expiration stack end
            }
            .ignoresSafeArea(.all)
            
            Button("Save Food") {
                foodItem.quantity = Int64(quantity)
                saveFood()
                goHome = true
            }
            .fontWeight(.bold)
            .font(.custom("AvenirNext-Medium", size: 24))
            .foregroundColor(.red)
            .padding()
            .frame(width: 325, height: 70)
            .background(Color.white)
            .cornerRadius(20)
            .position(x: 200, y: 800)
            
            NavigationLink(destination: HomeView().navigationBarBackButtonHidden(), isActive: $goHome) {
                EmptyView()
                
            }
        }
        .ignoresSafeArea()
        
    }
    
    func saveFood() {
        do {
            try modelContext.save()
        } catch {
            print("Buddy could not save the cuddy.")
        }
    }
    
}


