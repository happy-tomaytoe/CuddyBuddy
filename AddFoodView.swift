//
//  AddFoodView.swift
//  MagpantayCuddyBuddy
//
//  Created by Justine Lydia Magpantay on 4/17/25.
//

import SwiftUI
import SwiftData
import InputStepper

// creating the Food object, which has a name, type, and expiration date


// the view where you add food to the HomeView
struct AddFoodView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State var newFood: Food = Food(name: "", type: "", quantity: 0, expirationDate: Date.now)
    @State private var type: String = "Fruits"
    @State private var quantity: Float = 0
    @State var goHome = false
    
    let foodTypes: [String] = ["Fruits", "Vegetables", "Meats", "Canned Goods", "Dairy", "Desserts", "Leftovers"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red,.init(red: 1.0, green: 0.25, blue: 0.25), .init(red: 1.0, green: 0.45, blue: 0.45),.init(red: 1.0, green: 0.45, blue: 0.45), .red]), startPoint: .top, endPoint: .bottom)
            Text("Add Food")
                .font(.custom("Marker Felt", size: 56))
                .foregroundStyle(Color.white)
                .bold()
                .position(x: 200, y: 110)
            VStack(alignment:.leading, spacing: 70) {
                VStack(alignment:.leading, spacing: 6) { // Food name stack start
                    Text("  Food Name")
                        .bold()
                        .foregroundStyle(Color.white)
                        .font(.custom("AvenirNext-Medium", size: 24))
                    TextField("Enter food name", text: $newFood.name)
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
                    Picker("food types", selection: $type) {
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
                    DatePicker("", selection: $newFood.expirationDate, displayedComponents: [.date])
                        .frame(width: 130, height: 40, alignment: .center)
                        .background(Color.white.opacity(1))
                } // Food expiration stack end
            }
            
            .ignoresSafeArea(.all)
            Button("Add Food") {
                newFood.type = type
                newFood.quantity = Int64(quantity)
                print(String(newFood.quantity))
                modelContext.insert(newFood)
                saveFood()
                goHome = true
                newFood = Food(name: "", type: "", quantity: 0, expirationDate: Date())
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
            } // end of VStack
        }
        .ignoresSafeArea()
        } // Body View End
    
    func saveFood() {
        do {
            try modelContext.save()
        } catch {
            print("Buddy could not save the cuddy.")
        }
    }
    
    } // AddFoodView struct end

func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    return formatter.string(from: date)
}




