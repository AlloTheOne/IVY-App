//
//  grids.swift
//  Ivy
//
//  Created by Dina Alhajj Ibrahim on 13/12/2022.
//

import SwiftUI

struct grids: View {
    
    @State var gridLayout: [GridItem] = [ GridItem() ]
    @State private var showPopup: Bool = false
    @State private var showingAlert1 = false
    @State private var showPopover: Bool = false
    @State private var showingAlert2 = false
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
        
    ]
    let columns: [GridItem] = [
        
        GridItem(spacing: 100, alignment: .center),
        GridItem(spacing: 100, alignment: .center),
        GridItem(spacing: 100, alignment: .center),
        GridItem(spacing: 100, alignment: .center),
        GridItem(spacing: 100, alignment: .center),
        GridItem(spacing: 100, alignment: .center),
    ]
    
    let array = ["Volunteering", "Plastic Reduction" , "Sustainable" , "Recycling"  , "Planting" , "Safe Energy"]
    
    var body: some View {
        ZStack{
            LazyVGrid(columns: adaptiveColumns, spacing: 30)  {
                ForEach(0..<6) {index in
                    
                    HStack(alignment: .center){
                        ZStack (alignment: .bottom){
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: 150, height: 150)
                                .foregroundColor(Color("ourwhite"))
                                .shadow(radius: 3, x: -2, y: 2)
                            
                            VStack {
                                Image("pic\(index)")
                                    .resizable()
                                    .frame(width:90 ,height: 90)
                                Text(array[index])
                                    .foregroundColor(Color("ourgreen"))
                                    .fontWeight(.semibold)
                                    .font(.subheadline)
                                    .padding(.bottom, 8)
                                
                            }
                            Button(action: {
                                //ننادي الداتابايس و نضيف على البوينت المعينة قيمة gained + 10
                                self.showPopup = true
                            }) {
                                ZStack{
                                    Image(systemName: "circle")
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(Color("ourwhite"))
                                        .background(Color("ourwhite"))
                                        .clipShape(Circle())
                                        .padding(.bottom, 115)
                                        .padding(.leading, 133)
                                        .shadow(radius: 3, x: -2, y: 2)
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(Color("ourgray"))
                                        .frame(width: 50, height: 50)
                                        .padding(.bottom, 115)
                                        .padding(.leading, 133)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
    struct grids_Previews: PreviewProvider {
        static var previews: some View {
            grids()
        }
    }
}

