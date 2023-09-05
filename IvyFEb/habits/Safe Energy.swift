//
//  Safe Energy.swift
//  IvyFEb
//
//  Created by Fatma Gazwani on 13/07/1444 AH.
//

import SwiftUI

struct Safe_Energy: View {
    var body: some View {
        VStack{
            Text("Safe Energy")
                .font(.title)
                .bold()
                .foregroundColor(Color("ourgreen"))
                .multilineTextAlignment(.leading)
                .padding()
            Text("Saving energy reduces air and water pollution and conserves natural resources, which in turn creates a healthier living environment for people everywhere.")
                .multilineTextAlignment(.leading)
                .font(.body)
            Spacer()
        }.padding()
    }
}
struct Safe_Energy_Previews: PreviewProvider {
    static var previews: some View {
        Safe_Energy()
    }
}
