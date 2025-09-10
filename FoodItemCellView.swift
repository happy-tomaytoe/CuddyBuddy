//
//  FoodItemCellView.swift
//  MagpantayCuddyBuddy
//
//  Created by Justine Lydia Magpantay on 4/28/25.
//

import SwiftUI
import SwiftData
import InputStepper

struct FoodItemCellView: View {
    
    let item: Food
    
    var body: some View {
        NavigationLink(value: item) {
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .firstTextBaseline) {
                    Text(item.name)
                        .bold()
                        .font(.custom("AvenirNext-Medium", size: 24))
                    Text(String(item.quantity))
                        .font(.custom("AvenirNext-Medium", size: 24))
                        .padding(.leading, 10)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(changeExpirationDateColor(for: item.expirationDate))
                        .frame(height: 40)
                    Text(formattedDate(item.expirationDate))
                        .font(.custom("AvenirNext-Medium", size: 16))
                        .bold()
                        .padding(.horizontal, 10)
                }
                .fixedSize(horizontal: true, vertical: false)
            } // Cell Format Stack
            .padding(10)
        }
    }
}

func changeExpirationDateColor(for date: Date) -> Color {
    let expirationDate = Date()
    let today = Calendar.current
    
    if let daysUntilExpiration = today.dateComponents([.day], from: expirationDate, to: date).day {
        switch daysUntilExpiration {
        case ..<0:
            return .gray
        case 0...2:
            return .red
        case 3...7: 
            return .orange
        default:
            return .green
        }
    } else {
        return .green
    }
}
