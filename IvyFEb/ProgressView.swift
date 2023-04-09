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
    @State private var habitName: String = ""
    @State private var habits: [HabitEntity] = [HabitEntity]()
    @State private var GoToSting = false
    @State private var selectedFilter: ProgressFilterViewModel = .points
    @State var corentUser = ""
    var n = 80
    private func populateHabits(){
        habits = coreDM.getAllHabits()
    }
    @Namespace var animation
    @State var entries: [Int] = []

    @State var images = ["saveEarth", "energySaving", "ecoWater", "001", "002", "003"]
    let array = ["Volunteering", "Plastic Reduction" , "Sustainable" , "Recycling"  , "Planting" , "Safe Energy"]
    func getImage(num:String) -> String{
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
    @State var points  = [[50,100], [20,100], [70,100], [90,100]]
    @State var points2  = [["n",100], [20,100], [70,100], [90,100]]
//    @State var pointsArray: [[String, Int16]] = [["", 0]]
    @State var pointsArray: [[Int]] = []
    @State var doublePointsArray: [[Int]] = []
    @State var HabitArray: [String] = []
    @State var currentHabitName: String = ""
    @State var pointsCounter = 0
    @State var imagessCounter = -1
    @State var reachedHundred: [String] = []
    @State var uniqueHabitArray = []
    @State var uniquePointsArray = []
    //func here and call it on appear
    func pointsList() {
        pointsArray = []
        HabitArray = []
        for i in habits {
           
//            if (i.name == currentHabitName) {
            currentHabitName = i.name ?? ""
            var intPoints = Int(i.points)
            var stringHabit = String(i.name ?? "")
//            let unique = pointsArray(Set(arrayLiteral: intPoints))
            
            pointsArray += [[intPoints, 100]]
            HabitArray += [stringHabit]
            uniqueHabitArray = Array(Set(HabitArray))
            uniquePointsArray = Array(Set(pointsArray))
            print(uniqueHabitArray, uniquePointsArray)
            print(HabitArray, pointsArray)
                print("\(Double(pointsArray[0][0]))")
            if i.points == 100 {
                reachedHundred += [stringHabit]
                doublePointsArray += [[intPoints, 200]]
              
//                pointsArray[imagessCounter][1] = 200
                print(reachedHundred)
                print("under me line 82")
                print(pointsArray)
                print("under me line 84")
                print(doublePointsArray)
                for _ in reachedHundred {
                    imagessCounter += 1
                    print(imagessCounter)
                    print(i.id)
                }
            }
//            print(currentHabitName)
            print("\(Double(pointsArray[0][0]))")
            print(pointsArray)
//            }
        }
    }
    func countTotal() {
        pointsCounter = 0
        for i in habits {
           
                var intPoints = Int(i.points)
                pointsCounter += intPoints
                print(pointsCounter)
                print("apove me counter")
                
            
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
                    ForEach(uniqueHabitArray.indices, id: \.self){ index in
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
        }                        .padding(.horizontal)
        
    }
}

