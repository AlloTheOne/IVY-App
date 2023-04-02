//
//  ContentView.swift
//  IvyFEb
//
//  Created by Fatma Gazwani on 12/07/1444 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            VStack {
                HStack{
                    Spacer()
                    NavigationLink(destination: ProfileView(coreDM: CoreDataManager()), label: {
                        Text ("Progress")
                    })
                    .padding(.horizontal)
                }
                
                Text("What eco-friendly habits have you accomplished today?")
                    .foregroundColor(Color("ourgreen"))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical)
                
                grids()
            }
            .padding(.bottom, 78)
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
