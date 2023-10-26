//
//  WeatherButton.swift
//  Wether
//
//  Created by Pushkar on 25/10/23.
//

import SwiftUI


struct WeatherButton: View {
    var title:String
    var textColor:Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .font(.system(size: 25, weight: .semibold))
            .cornerRadius(13)
    }
}
