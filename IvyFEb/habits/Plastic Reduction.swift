//
//  Plastic Reduction.swift
//  IvyFEb
//
//  Created by Fatma Gazwani on 13/07/1444 AH.
//

import SwiftUI

struct Plastic_Reduction: View {
    var body: some View {
        VStack{
            Text("Plastic Reduction")
                .font(.title)
                .bold()
                .foregroundColor(Color("ourgreen"))
                .multilineTextAlignment(.leading)
                .padding()
            Text("The benefits of reducing plastic consumption include: Preventing pollution by lessening the amount of new raw materials used. Saves energy.")
                .multilineTextAlignment(.leading)
                .font(.title2)
            Spacer()
        }.padding()
    }
}
struct Plastic_Reduction_Previews: PreviewProvider {
    static var previews: some View {
        Plastic_Reduction()
    }
}
