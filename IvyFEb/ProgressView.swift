//
//  ProfileView.swift
//  tiwtterSwiftUI
//
//  Created by Sara Khalid BIN kuddah on 21/05/1444 AH.
//

import SwiftUI
import CloudKit
struct ProfileView: View {
    @State private var GoToSting = false
    @State private var selectedFilter: ProgressFilterViewModel = .points
    @State var corentUser = ""
    @Namespace var animation
    @State var images = ["saveEarth", "energySaving", "ecoWater", "001", "002", "003"]
    @State var points  = [[50,100], [20,100], [70,100], [90,100]]
    //    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //    @AppStorage("userId") var userId: String = ""
    //    private var isSignedIn: Bool {
    //        !userId.isEmpty
    //    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            progressFilterBar
            switch selectedFilter{
            case .points:
                pointsView
            case .badges:
                repliesView
            }
            Spacer()
            
        }
    }
    //  View Model
    //     func fetchUser(){
    //        let container = CKContainer(identifier: "iCloud.com.thedreamers.ivy")
    //        let predicateAll = NSPredicate(value: true)
    //        let predicateJumana = NSPredicate(format: "name ==%@", "Jumana Khaled")
    //        let query = CKQuery(recordType: "User", predicate: predicateAll)
    //
    //        let operations = CKQueryOperation(query: query)
    //        operations.recordMatchedBlock = {  recordId, result in
    ////            case .success( let records):
    ////            let learner = Learner(record: records)
    ////            self.learners.append(learner)
    //            switch result {
    //            case .success( let records):
    //                let user = User(record: records)
    //                self.corentUser =  "\(user.firstName) \(user.lastName)"
    //                print("record: records")
    //            case .failure( let error):
    //                print(error.localizedDescription)
    //                print("let error")
    //            }
    //        }
    //        container.publicCloudDatabase.add(operations)
    //    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            VStack{
                ProfileView()
                    .navigationTitle("Progress")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
extension ProfileView{
    
    var progressFilterBar: some View{
        HStack{
            ForEach(ProgressFilterViewModel.allCases, id: \.rawValue){ item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? Color("ourgreen") : Color("ourlightgreen"))
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color("ourgreen"))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider()
            .offset(x: 0 , y: 15))
        
    }
    
    var pointsView: some View{
        VStack{
            HStack{
                Text("Total Points :")
                    .font(.title2).bold()
                    .foregroundColor(Color("ourgray"))
                Spacer()
                Text("\(points[0][0]+points[1][0]+points[2][0]+points[3][0])")
                    .font(.title2).bold()
                    .foregroundColor(Color("ourgreen"))
            }
            .padding(.top, 25)
            .padding(.horizontal, 24)
            ScrollView{
                LazyVStack{
                    ForEach(points.indices, id: \.self){ index in
                        VStack {
                            HStack{
                                Text("Habit No\(index+1)")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("ourgray"))
                                Spacer()
                                Text("\(points[index][0])/\(points[index][1])")
                                    .font(.subheadline)
                                    .foregroundColor(Color("ourgray"))
                                    .fontWeight(.semibold)
                            }.padding(.horizontal)
                            ProgressView( value: Double(points[index][0]),
                                          total: Double(points[index][1]))
                            .tint((Color("ourgreen")))
                            .padding(.horizontal)
                            .padding(.bottom)
                            .progressViewStyle(RoundedRectProgressViewStyle())
                            
                            Divider()
                        }
                        .padding()
                    }
                }
            }
        }
    }
    struct RoundedRectProgressViewStyle: ProgressViewStyle {
        func makeBody(configuration: Configuration) -> some View {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 14)
                    .frame(height: 7)
                    .foregroundColor((Color("ourlightgreen")))
                
                RoundedRectangle(cornerRadius: 14)
                    .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 7)
                    .foregroundColor((Color("ourgreen")))
            }
        }
    }
    var repliesView: some View{
        ScrollView{
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 4), count: 2), content: {
                ForEach(images, id: \.self){ image in
                    Image(image)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                }
            })
        }                        .padding(.horizontal)
        
    }
}

