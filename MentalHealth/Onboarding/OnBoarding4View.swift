//
//  OnBoarding4View.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct OnBoarding4View: View {
    @State var selectedTag = 0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                        
                        Text("Звички • 4/4")
                            .font(.mainLight())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image("cross")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 26)
                            .hidden()
                    }
                    
                    Text("Як ви дбаєте про своє здоров’я?")
                        .font(.mainRegular(size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }
                .padding(.bottom, 60)
                
                ScrollView(showsIndicators: false) {
                    OnboardingCellView(selectedTag: $selectedTag, tag: 1, text: "Періодично відвідую лікаря")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 2, text: "Займаюся спортом")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 3, text: "Здорово харчуюся")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 4, text: "Приймаю вітаміни")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 5, text: "Займаюся з терапевтом")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 6, text: "Не дбаю про здоров’я")
                        .padding(.bottom, 10)
                }

                .padding(.horizontal, 24)
                
                Spacer()
                
                NavigationLink(destination: OnBoarding5View()) {
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

struct OnBoarding4View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding4View()
    }
}
