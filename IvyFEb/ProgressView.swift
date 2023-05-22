//
//  ProfileView.swift
//  tiwtterSwiftUI
//
//  Created by Sara Khalid BIN kuddah on 21/05/1444 AH.
//

import SwiftUI
import CloudKit
struct ProfileView: View {
    @StateObject var coreDM: CoreDataManager
    @State private var habits: [HabitEntity] = [HabitEntity]()
    @State private var GoToSting = false
    @State private var selectedFilter: ProgressFilterViewModel = .points
    private func populateHabits(){
        habits = coreDM.getAllHabits()
    }
    @Namespace var animation

    func getImage(num:String) -> String {
        let liveAlbums = num
        switch liveAlbums {
        case "Volunteering":
            return "saveEarth"
        case "Plastic Reduction":
            return "energySaving"
        case "Sustainable":
            return "ecoWater"
        case "Recycling":
            return "001"
        case "Planting":
            return "002"
        default:
            return "003"
            
        }
    }

    @State var pointsArray: [[Int]] = []
    @State var HabitArray: [String] = []
    @State var currentHabitName: String = ""
    @State var pointsCounter = 0
    @State var imagessCounter = -1
    @State var reachedHundred: [String] = []
    @State var levelTwo: [String] = []
    @State var levelThree: [String] = []
    @State var levelFour: [String] = []
    @State var levelFive: [String] = []
    
    
    //func here and call it on appear
    func pointsList() {
        pointsArray = []
        HabitArray = []
        for i in habits {
            
            imagessCounter = 0
            reachedHundred = []
            levelTwo = []
            
            currentHabitName = i.name ?? ""
            let intPoints = Int(i.points)
            let stringHabit = String(i.name ?? "")

            
            pointsArray += [[intPoints, 100]]
            HabitArray += [stringHabit]
            
           
            for index in HabitArray.indices {
                let firstIndex = pointsArray[index][0]
                let imageApoveTwoHundred = HabitArray[index]
                
                    if firstIndex >= 100 && firstIndex <= 199{
                        reachedHundred += [imageApoveTwoHundred] //1
                        imagessCounter += 1
                        pointsArray[index][1] = 200
                    } else if firstIndex >= 200 && firstIndex <= 299{
                        reachedHundred += [imageApoveTwoHundred]
                        levelTwo += [imageApoveTwoHundred] //2
                        pointsArray[index][1] = 300
                    } else if firstIndex >= 300 && firstIndex <= 399{
                        reachedHundred += [imageApoveTwoHundred]
                        levelTwo += [imageApoveTwoHundred]
                        levelThree += [imageApoveTwoHundred] //3
                        pointsArray[index][1] = 400
                    } else if firstIndex >= 400 && firstIndex <= 499{
                        reachedHundred += [imageApoveTwoHundred]
                        levelTwo += [imageApoveTwoHundred]
                        levelThree += [imageApoveTwoHundred]
                        levelFour += [imageApoveTwoHundred] //4
                        pointsArray[index][1] = 500
                    } else if firstIndex == 500 {
                        reachedHundred += [imageApoveTwoHundred]
                        levelTwo += [imageApoveTwoHundred]
                        levelThree += [imageApoveTwoHundred]
                        levelFour += [imageApoveTwoHundred]
                        levelFive += [imageApoveTwoHundred] //5
                        pointsArray[index][1] = 500
                    }
            }

        }
    }
    func countTotal() {
        pointsCounter = 0
        for i in habits {
            let intPoints = Int(i.points)
            
            pointsCounter += intPoints
        }
    }
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
    
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack{
//            VStack{
//                ProfileView(coreDM: CoreDataManager())
//                    .navigationTitle("Progress")
//                    .navigationBarTitleDisplayMode(.inline)
//            }
//        }
//    }
//}
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
                // if statement here !!
                Text("\(pointsCounter)")
                    .font(.title2).bold()
                    .foregroundColor(Color("ourgreen"))
            }
            .padding(.top, 25)
            .padding(.horizontal, 24)
            ScrollView{
                LazyVStack{
                    ForEach(HabitArray.indices, id: \.self){ index in
                        VStack {
                            HStack{
                                // here should be the name of the habit
//                                Text("Habit No\(index+1) \(currentHabitName)")
                                Text(HabitArray[index])
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("ourgray"))
                                Spacer()
                                // here is the points out of 100
                                Text("\(pointsArray[index][0])/\(pointsArray[index][1])")
                                    .font(.subheadline)
                                    .foregroundColor(Color("ourgray"))
                                    .fontWeight(.semibold)
                            }// HStack
                            .padding(.horizontal)
                            // here is the progress view
                            // an issue occured it could take more than 100 !! maybe an if statement will fix it
                            // try to put the if statement here if needed
                            ProgressView( value: Double(pointsArray[index][0]),
                                          total: Double(pointsArray[index][1]))
                            .tint((Color("ourgreen")))
                            .padding(.horizontal)
                            .padding(.bottom)
                            .progressViewStyle(RoundedRectProgressViewStyle())
                            Divider()
                            // after each HStack progress view and divider
                        } // VStack
                        .padding()
                    } // end of loop
                }
            }
        }
        .onAppear{
            populateHabits()
            pointsList()
            countTotal()
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
                ForEach(reachedHundred, id: \.self){ index in
                    Image("\(getImage(num: index))")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                    
                }
            })
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 4), count: 2), content: {
                ForEach(levelTwo, id: \.self){ index1 in
                    Image("\(getImage(num: index1))")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding()
                   
                }
                
            })
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 4), count: 2), content: {
            ForEach(levelThree, id: \.self){ index1 in
                Image("\(getImage(num: index1))")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
               
            }
            
        })
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 4), count: 2), content: {
            ForEach(levelFour, id: \.self){ index1 in
                Image("\(getImage(num: index1))")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
               
            }
            
        })
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 4), count: 2), content: {
            ForEach(levelFive, id: \.self){ index1 in
                Image("\(getImage(num: index1))")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
               
            }
            
        })
        }
        .padding(.horizontal)
        
    }
}

