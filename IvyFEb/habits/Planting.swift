//
//  Planting.swift
//  IvyFEb
//
//  Created by Fatma Gazwani on 13/07/1444 AH.
//

import SwiftUI

struct Planting: View {
    var body: some View {
        VStack{
            Text("Planting")
                .font(.title)
                .bold()
                .foregroundColor(Color("ourgreen"))
                .multilineTextAlignment(.leading)
                .padding()
            Text("Plants act as highly effective air cleaners, absorbing carbon dioxide, plus many air pollutants, while releasing clean oxygen and fragrance.")
                .multilineTextAlignment(.leading)
                .font(.body)
            Spacer()
        }.padding()
    }
}
struct Planting_Previews: PreviewProvider {
    static var previews: some View {
        Planting()
    }
}
