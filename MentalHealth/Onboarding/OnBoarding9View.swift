//
//  OnBoarding9View.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct OnBoarding9View: View {
    @State var selectedTag = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var data: [String] = ["Так", "Ні"]
    
    var body: some View {
        ZStack {
            VStack {
                Image("onboarding-header")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.top)
                
                
                Spacer()
            }
            VStack {
                VStack {
                    HStack {
                        Image("back-arrow")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .padding(.leading, 26)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        
                        Spacer()
                        
                        Text("Знайомство • 4/4")
                            .font(.mainLight())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image("cross")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 26)
                            .hidden()
                    }
                    
                    Text("Чи маєте ви бойові поранення?")
                        .font(.mainRegular(size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                    
                    Text("* Щоб отримувати доцільніші поради")
                        .font(.mainUltraLight())
                        .foregroundColor(.lightGray)
                        .padding(.top, 1)
                        .opacity(0.0)
                }
                .padding(.bottom, 60)
                
                ScrollView(showsIndicators: false) {
                    ForEach(0..<data.count, id: \.self) { id in
                        let text = data[id]
                        OnboardingCellView(selectedTag: $selectedTag, tag: id + 1, text: text)
                            .padding(.bottom, 10)
                    }
                }

                .padding(.horizontal, 24)
                
                Spacer()
                
                NavigationLink(destination: OnBoarding10View()) {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundColor(selectedTag != 0 ? .darkGreen : .lightGray)
                        .padding(.horizontal, 24)
                        .frame(height: 48)
                        .overlay {
                            Text("Продовжити")
                                .foregroundColor(.white)
                                .font(.mainRegular())
                        }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)

    }
}

struct OnBoarding9View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding9View()
    }
}
