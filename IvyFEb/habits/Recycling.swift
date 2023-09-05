//
//  Recycling.swift
//  IvyFEb
//
//  Created by Fatma Gazwani on 13/07/1444 AH.
//

import SwiftUI

struct Recycling: View {
    var body: some View {
        VStack{
            Text("Recycling")
                .font(.title)
                .bold()
                .foregroundColor(Color("ourgreen"))
                .multilineTextAlignment(.leading)
                .padding()
            Text("Recycling is the process of collecting and processing materials ,that would otherwise be thrown away as trash and remanufacturing them into new products.")
                .multilineTextAlignment(.leading)
                .font(.body)
            Spacer()
        }.padding()
    }
}

struct Recycling_Previews: PreviewProvider {
    static var previews: some View {
        Recycling()
    }
}
