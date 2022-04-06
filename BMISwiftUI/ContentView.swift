//
//  ContentView.swift
//  BMISwiftUI
//
//  Created by Amged on 4/6/22.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @State private var weightText = ""
    @State private var heightText = ""
    @State private var bmi: Double = 0
    @State private var classification =  ""
    
    var body: some View {
        // text fields
        VStack {
           
            GroupBox{
                Text("BMI Calculator:").font(.largeTitle)
                Spacer()
                TextField("Enter Weight (in Kgs)", text: $weightText).textFieldStyle(RoundedBorderTextFieldStyle()).border(Color.black)
                Spacer()
                TextField("Enter Height (in m)", text: $heightText).textFieldStyle(RoundedBorderTextFieldStyle()).border(Color.black)
                Spacer()
            }.frame( height: 200)
            
            
            Button (action:{
                let weight =  Double(self.weightText)!
                let height =  Double(self.heightText)!
                
                self.bmi = weight/(height*height)
                if bmi < 18.5 {
                    self.classification = "Underweigth"
                }else if bmi < 24.9{
                    self.classification = "Healthy weigth"
                }else if bmi < 29.9 {
                    self.classification = "Overweight"
                }else{
                    self.classification = "Obese"
                }
            }){
                Text("Calculate BMI")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
            }
            Text("BMI: \(bmi,specifier: "%.1f"), \(classification)").font(.title2).fontWeight(.bold).scaledToFit().padding()

        }.padding(45)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
