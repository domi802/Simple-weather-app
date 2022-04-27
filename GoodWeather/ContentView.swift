//
//  ContentView.swift
//  GoodWeather
//
//  Created by Dominik Woźniak on 10/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init(){
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter City name", text: self.$weatherVM.cityName){
                self.weatherVM.search()
            }.font(.custom("Arial",size: 30))
                .padding()
                .fixedSize()
            
              
            Text(self.weatherVM.temperature)
                .font(.custom("Arial",size: 10))
                .offset(y: 100)
                .foregroundColor(Color.white)
                .padding()
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
