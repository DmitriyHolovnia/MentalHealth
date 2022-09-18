//
//  OnBoarding2View.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct OnBoarding2View: View {
    
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
                        
                        Text("Звички • 2/4")
                            .font(.mainLight())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image("cross")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 26)
                            .hidden()
                    }
                    
                    Text("Як ви проводите свій вільний час?")
                        .font(.mainRegular(size: 24))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }
                .padding(.bottom, 60)
                
                ScrollView(showsIndicators: false) {
                    OnboardingCellView(selectedTag: $selectedTag, tag: 1, text: "Дивляюся фільми, серіали")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 2, text: "Зустрічаюся з друзями")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 3, text: "Залишаюся вдома")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 4, text: "Займаюся справами по дому")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 5, text: "Проводжу час з родиною")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 6, text: "Відпочиваю на природі")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 7, text: "Проводжу весь час на роботі")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 8, text: "Відвідую фізичні процедури")
                        .padding(.bottom, 10)
                    
                    OnboardingCellView(selectedTag: $selectedTag, tag: 8, text: "Iнше")
                        .padding(.bottom, 10)
                }

                .padding(.horizontal, 24)
                
                Spacer()
                
                NavigationLink(destination: OnBoarding3View()) {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundColor(selectedTag != 0 ? .darkGreen : .lightGray)
                        .padding(.horizontal, 24)
                        .frame(height: 48)
                        .overlay {
                            Text("Наступне питання")
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

struct OnBoarding2View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding2View()
    }
}
