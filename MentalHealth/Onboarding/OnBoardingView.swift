//
//  OnBoardingView.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct OnBoardingView: View {
    
    @State var selectedTag = 0
    
    var body: some View {
//        NavigationView {
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
                            
                            Spacer()
                            
                            Text("Звички • 1/4")
                                .font(.mainLight())
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image("cross")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .padding(.trailing, 26)
                                .hidden()
                        }
                        
                        Text("Як часто ви вживаєте алкоголь?")
                            .font(.mainRegular(size: 24))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                    }
                    .padding(.bottom, 60)
                    
                    VStack(spacing: 16) {
                        OnboardingCellView(selectedTag: $selectedTag, tag: 1, text: "Щодня")
                        
                        OnboardingCellView(selectedTag: $selectedTag, tag: 2, text: "Декілька разів на тиждень")
                        
                        OnboardingCellView(selectedTag: $selectedTag, tag: 3, text: "Декілька разів на місяць")
                        
                        OnboardingCellView(selectedTag: $selectedTag, tag: 4, text: "Не вживаю алкоголь")
                    }
                    .padding(.horizontal, 24)
                    
                    Spacer()
                    
                    NavigationLink(destination: OnBoarding2View()) {
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
//        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
