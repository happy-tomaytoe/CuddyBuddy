//
//  SettingsView.swift
//  MagpantayCuddyBuddy
//
//  Created by Justine Lydia Magpantay on 4/17/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red,.init(red: 1.0, green: 0.25, blue: 0.25), .init(red: 1.0, green: 0.45, blue: 0.45),.init(red: 1.0, green: 0.45, blue: 0.45), .red]), startPoint: .top, endPoint: .bottom)
            
            Text("Welcome to CuddyBuddy!")
                .font(.custom("Marker Felt", size: 48))
                .foregroundStyle(Color.white)
                .bold()
                .frame(alignment: .center)
                .position(x: 200, y: 110)
            
            VStack {
                Text("CuddyBuddy is a fun pantry management app that helps you keep track of your food items and their expiration dates. You can add new items, check their expiration dates, and edit it them to match what you actually have in your pantry.\n\n This app aims to help everyday people manage and keep track of what's in the kitchen to reduce food waste and save money.")
                    .bold()
                    .foregroundStyle(Color.white)
                    .font(.custom("AvenirNext-Medium", size: 24))
                    .frame(alignment: .center)
                    .padding(20)
                
                Text("Made by Justine Lydia Magpantay\n Contact Information\n Email: justinelydiamagpantay@gmail.com")
                    .bold()
                    .foregroundStyle(Color.white)
                    .font(.custom("AvenirNext-Medium", size: 12))
                    .frame(alignment: .center)
                    .padding(20)
            }
            .padding(20)
            .position(x: 200, y: 515)
        }
        
        .ignoresSafeArea()
    }
}

#Preview {
    SettingsView()
}
