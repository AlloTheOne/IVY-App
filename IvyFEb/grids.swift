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
    
    @State var entries = [1, 2, 3, 4, 5, 6]
    @State var currentSelection: Int? = nil

    func getHabitName(num:Int) -> String{
        let liveAlbums = num
        switch liveAlbums {
        case 1:
            return "Volunteering"
        case 2:
            return "Plastic Reduction"
        case 3:
            return "Sustainable"
        case 4:
            return "Recycling"
        case 5:
            return "Planting"
        default:
            return "Safe Energy"
            
        }
    }
    func getHabitDetails(num:Int) -> String{
        let liveAlbums = num
        switch liveAlbums {
        case 1:
            return " Volunteering is a voluntary act of an individual or group freely giving time and labor for community service."
        case 2:
            return "The benefits of reducing plastic consumption include: Preventing pollution by lessening the amount of new raw materials used. Saves energy."
            
        case 3:
            return "Being committed to sustainability will reduce your carbon footprint and the amount of toxins released into the environment, making it safe. When we focus on sustainability, the entire world benefits and gets to live in clean, more healthy living conditions."
        case 4:
            return "Recycling is the process of collecting and processing materials ,that would otherwise be thrown away as trash and remanufacturing them into new products."
        case 5:
            return ":Plants act as highly effective air cleaners, absorbing carbon dioxide, plus many air pollutants, while releasing clean oxygen and fragrance."
        default:
            return "Saving energy reduces air and water pollution and conserves natural resources, which in turn creates a healthier living environment for people everywhere."
            
        }
    }
    let habit = HabitEntity()
    
    var body: some View {
        ZStack{
            LazyVGrid(columns: adaptiveColumns, spacing: 30)  {
                ForEach(entries.sorted(), id: \.self) { index in
                    
                    NavigationLink(
                        destination: DetailView(coreDM: CoreDataManager(), currentHabitName: getHabitName(num: index),currentHabitDetails: getHabitDetails(num: index),habit: habit),
                        label: {
                            
                            HStack(alignment: .center){
                                ZStack (alignment: .bottom){
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 150, height: 150)
                                        .foregroundColor(Color("ourwhite"))
                                        .shadow(radius: 3, x: -2, y: 2)
                                    
                                    VStack {
                                        Image("pic\(index-1)")
                                            .resizable()
                                            .frame(width:90 ,height: 90)
                                        Text(" \(getHabitName(num: index))")
                                            .foregroundColor(Color("ourgreen"))
                                            .fontWeight(.semibold)
                                            .font(.subheadline)
                                            .padding(.bottom, 8)
                                        
                                        
                                    }
                                    
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
                          
                            
                        })
                    
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

struct DetailView: View {
    @StateObject var coreDM: CoreDataManager
    @State private var habitName: String = ""
    @State private var habits: [HabitEntity] = [HabitEntity]()
    private func populateHabits(){
        habits = coreDM.getAllHabits()
    }
    @State var updatedHabit = ""
    
    @State var updatedPoints: Int16 = 0
    let currentHabitName: String
    let currentHabitDetails: String
    let habit: HabitEntity
    //for update
    func habitList() {
        for i in habits {
            if (i.name == currentHabitName) {
                print(i.name ?? "hii")
                updatedHabit = i.name ?? "hii"
                print("pointttt \(i.points)" )
                updatedPoints = i.points
            }
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                Text("Habit Name:")
                Text("\(currentHabitName)")
                Text("Habit Details:")
                Text("\(currentHabitDetails)")
                
//                        TextField("Enter Habit ", text:$habitName)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Did you contorbute ?")
                Button("yes"){
                    // update habit's points
                    if(coreDM.isItOnCoredata(name: currentHabitName) ){
                        let currentHabit = coreDM.fetchByname(name: currentHabitName)
                        if (currentHabit.points < 100) {
                            currentHabit.points = currentHabit.points + 5
                            
                            coreDM.saveItems()
                            populateHabits()
                        } else {
                            print("reached limit")
                        }
                    }else{
                        //create new Habit
//                        populateHabits()
                        coreDM.addItem(name: currentHabitName, points: 5)
                        populateHabits()
                    }
                    habitList()
                }
                Spacer()
                VStack {
                    
                    Text(updatedHabit)
                    Text("\(updatedPoints)")
                }
//                List(habits, id: \.self){
//                    habit in
//                    Text(habit.name ?? "")
//                    Text("habit.points : \(habit.points)")
//                }
//                .listStyle(.plain)
            }.padding()
                .navigationTitle("Habit")
            
                .onAppear(perform: {
                   populateHabits()
                    habitList()
                })

        }
    }
}

public struct LazyView<Content: View>: View {
    private let build: () -> Content
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    public var body: Content {
        build()
    }
}

struct EmptyNavigationLink<Destination: View>: View {
    let lazyDestination: LazyView<Destination>
    let isActive: Binding<Bool>
    
    init<T>(
        @ViewBuilder destination: @escaping (T) -> Destination,
        selection: Binding<T?>
    )  {
        lazyDestination = LazyView(destination(selection.wrappedValue!))
        isActive = .init(
            get: { selection.wrappedValue != nil },
            set: { isActive in
                if !isActive {
                    selection.wrappedValue = nil
                }
            }
        )
    }
    
    var body: some View {
        NavigationLink(
            destination: lazyDestination,
            isActive: isActive,
            label: { EmptyView() }
        )
    }
}

struct EntrieButton:View{
@State var showSheet = false
var entry:String

var body: some View {
Button(action:{self.showSheet = true}){
    Text(entry)
}.sheet(isPresented: $showSheet){
    
        VStack {
            Text("My Sheet number \(entry)")
           
        }
    
    
}
}
}
