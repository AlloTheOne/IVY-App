//
//  Sustainability.swift
//  IvyFEb
//
//  Created by Fatma Gazwani on 13/07/1444 AH.
//

import SwiftUI

struct Sustainability: View {
    var body: some View {
        VStack{
            Text("Sustainability")
                .font(.title)
                .bold()
                .foregroundColor(Color("ourgreen"))
                .multilineTextAlignment(.leading)
                .padding()
            Text("eing committed to sustainability will reduce your carbon footprint and the amount of toxins released into the environment, making it safe. When we focus on sustainability, the entire world benefits and gets to live in clean, more healthy living conditions.")
                .multilineTextAlignment(.leading)
                .font(.body)
            
            Spacer()
            
        }.padding()
    }
}
struct Sustainability_Previews: PreviewProvider {
    static var previews: some View {
        Sustainability()
    }
}
