
//  ContentView.swift
//  My Screen
//
//  Created by Shouq Turki Bin Tuwaym on 29/03/1444 AH.


import SwiftUI


struct SectionContent{
    let image:Image
    let text:String
}

var values = [
    SectionContent(
        image:Image(systemName: "figure.walk"),
        text:"العظام والمفاصل"
    ),
    SectionContent(
        image:Image(systemName: "list.clipboard.fill"),
        text:"الصحة العامة"
    ),
    SectionContent(
        image:Image(systemName: "bubbles.and.sparkles.fill"),
        text:"الطب الشعبي "
    ),
    SectionContent(
        image:Image(systemName: "heart.text.square.fill"),
        text:"أمراض الباطنية "
    ),
    SectionContent(
        image:Image(systemName: "figure.strengthtraining.functional"),
        text:"Safe Energy"
    ),
    SectionContent(
        image:Image(systemName: "lungs.fill"),
        text:"أمراض الجهاز التنفسي"
    ),
    SectionContent(
        image:Image("Girl"),
        text:"النساء والولادة"
    ),
    SectionContent(
        image:Image(systemName: "allergens.fill"),
        text:"الجلدية"
    )
]
    
struct BoxView: View {

    let sectionContent: SectionContent

    var body: some View {
//        NavigationLink(destination: LoginView()){
            VStack{
                self.sectionContent.image.foregroundColor(.white)
                    .padding(5)
                Text(self.sectionContent.text).foregroundColor(Color("ourgreen"))
            }
            .padding()
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .center
            )
            .frame(height: 110)
            .background(.white)
            .cornerRadius(20)
            .padding(10)
//            //.padding(.top, 0)
//        }
//        .navigationBarBackButtonHidden(true)
    }
}


struct SwiftUIView2Shoug: View {


    var body: some View {
        Color.gray.ignoresSafeArea()
            
            VStack (spacing: 40) {
                
//                AuthenticationHeader(title1: "", title2: "What eco-friendly habits have you done today?")
                
//                Text("مرحبًا بك في اسأل\r\nماهو نوع سؤالك")
//                    .multilineTextAlignment(.center).lineSpacing(22)

                VStack(spacing: 10){
                    ForEach(
                        0 ..< Int(
                            ceil(
                                Double(values.count)/2.0
                            )
                        ),
                        id: \.self
                    ) { i in
                        HStack(spacing: 20) {
                            BoxView(sectionContent: values[i*2])
                            if(i*2+1 < values.count){
                                BoxView(sectionContent: values[i*2+1])
                            }
                            
                        }
                    }
                }.padding([.trailing, .leading], 24)
//                    .statusBarHidden(true)
//                    .onAppear()
//                    .navigationBarBackButtonHidden(true)
//                    .navigationBarBackButtonHidden(false)
//                    .onDisappear()
//                    .navigationBarBackButtonHidden(true)


                

            }
    }
}




struct SwiftUIView2Shoug_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2Shoug()

    }
}

