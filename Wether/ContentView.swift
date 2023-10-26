//
//  ContentView.swift
//  Weather
//
//  Created by Pushkar on 25/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            BackgroundView(topColor: isNight ? .black : .green, bottomColor: isNight ? .gray : Color("lightBlue"))
            
            VStack{
               CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ?  "moon.stars.fill":"cloud.sun.fill", temperature: 76)
                
                HStack(spacing:20){
                    
                    WetherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WetherDayView(dayOfWeek: "WED", imageName: "wind.snow", temperature: 25)
                    WetherDayView(dayOfWeek: "THR", imageName: "cloud.rain.fill", temperature: 55)
                    WetherDayView(dayOfWeek: "FRI", imageName: "cloud.drizzle.fill", temperature: 56)
                    WetherDayView(dayOfWeek: "SAT", imageName: "cloud.fog.fill", temperature: 10)
                }
               
                    Spacer()
                
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
                
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WetherDayView: View {
    var dayOfWeek:String
    var imageName:String
    var temperature:Int
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor:Color
    var bottomColor:Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, Color(bottomColor)]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView : View {
    
    var cityName: String
    
    var body: some View {
        
        VStack{
            Text(cityName)
                .font(.system(size: 32))
                .foregroundStyle(.white)
                .padding()
            
        }
    }
    
}

struct MainWeatherStatusView : View {
    
    var imageName: String
    var temperature:Int
    
    var body: some View {
        VStack(spacing:8 ){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}



