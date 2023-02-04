//
//  OnbordingView.swift
//  CountDown
//
//  Created by Fatma Gazwani on 13/06/1444 AH.
//
import SwiftUI


enum OnbordingType: CaseIterable {

    case ive
    
    var image: String {
        switch self {
        case .ive:
            return "ive"
        }
    }
    
    var title: String {
        switch self {
        case .ive:
            return "ive"
        }
    }
    
    var description: String {
        switch self {
        case .ive:
            return "Ivy"
        }
    }
}


struct OnbordingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isUserOnboarded") var isUserOnboarded: Bool = false
    @State var selectedOnbordingType: OnbordingType = .ive
    
    var body: some View {
        ZStack {
            
            TabView(selection: $selectedOnbordingType) {
                
                ForEach(OnbordingType.allCases, id: \.title) { onbording in
                    SingleOnbordingView(onbordingType: onbording)
                        .tag(onbording)
                        .onChange(of: selectedOnbordingType, perform: { newValue in
                            selectedOnbordingType = newValue
                        })
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .onAppear {
            setupAppearance()
        }
    }
}

struct OnbordingView_Previews: PreviewProvider {
    static var previews: some View {
        OnbordingView()
    }
}


extension OnbordingView {
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor =
        colorScheme == .dark ? .white : .black
        UIPageControl.appearance().pageIndicatorTintColor = colorScheme == .dark ? UIColor.white.withAlphaComponent(0.2) : UIColor.black.withAlphaComponent(0.2)
    }
}

