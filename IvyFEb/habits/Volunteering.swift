//
//  Volunteering.swift
//  IvyFEb
//
//  Created by Fatma Gazwani on 13/07/1444 AH.
//

import SwiftUI

struct Volunteering: View {
    var body: some View {
        VStack{
            Text("Volunteering")
                .font(.title)
                .bold()
                .foregroundColor(Color("ourgreen"))
                .multilineTextAlignment(.leading)
                .padding()
            Text("Volunteering is a voluntary act of an individual or group freely giving time and labor for community service.")
                .multilineTextAlignment(.leading)
                .font(.body)
            Spacer()
        }.padding()
    }
}
struct Volunteering_Previews: PreviewProvider {
    static var previews: some View {
        Volunteering()
    }
}
