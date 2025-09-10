//
//  HomeToolbarView.swift
//  MagpantayCuddyBuddy
//
//  Created by Justine Lydia Magpantay on 4/29/25.
//

import SwiftUI

struct HomeToolbarView: ToolbarContent {
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.red)
                    .frame(width: 400, height: 120)
                HStack (spacing: 80) {
                    NavigationLink(destination: AddFoodView()) {
                        Image("adddesign")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    NavigationLink(destination: SettingsView()) {
                        Image("settings design")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                } // end of Button HStack
            } // end of Button ZStack
        }
    }
}


