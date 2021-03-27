//
//  ContentView.swift
//  WorldTraveler
//
//  Created by Turhan Sel on 21.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue: String = ""
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    
    func convertToCelcius() -> String {
        if let value = Double(fahrenheitValue){
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            let celciusValue = fahrenheit.converted(to: .celsius)
            return numberFormatter.string(from: NSNumber(value: celciusValue.value)) ?? "???"
            
        }
        else {
            return "???"
        }
    }
    
    var body: some View {
        VStack{
            TextField("value", text: $fahrenheitValue)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64))
                .multilineTextAlignment(.center)
                .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("fahrenheit")
            Text("is actually")
                .foregroundColor(.gray)
            Text(convertToCelcius())
                .font(Font.system(size: 64))
            Text("degress Celcius")
            Spacer()
        }
        .foregroundColor(.orange)
        .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
