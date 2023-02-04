//
//  Picker.swift
//  IvyFEb
//
//  Created by Fatma Gazwani on 12/07/1444 AH.
//

import SwiftUI

struct Picker: View {

    @State private var selected = "SwiftUI"

    var body: some View {
        VStack{
//            Picker("Choose course", selection: $selected) {
//                Text("SwiftUI")
//                    .tag("SwiftUI")
//                Text("UIKit")
//                    .tag("UIKit")
//            }
//            .pickerStyle(.segmented)
        }
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        Picker()
    }
}
