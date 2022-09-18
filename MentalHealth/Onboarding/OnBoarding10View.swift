//
//  OnBoarding10View.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct OnBoarding10View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.darkGreen.ignoresSafeArea()
            
            VStack {
                Image("login-circle")
                    .resizable()
                    .scaledToFit()
                    .ignoresSafeArea(edges: .top)
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                HStack {
                    Image("back-arrow")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .padding(.leading, 26)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    
                    Spacer()
                }
                .opacity(0.0)
                
                Image("onboarding-1")
                    .padding(.bottom, 40)
                    .padding(.top, 40)
                
                Text("Готово!")
                    .font(.mainRegular(size: 22))
                    .foregroundColor(.white)
                
                Text("Готуємо персоналізовану програму")
                    .font(.mainLight())
                    .foregroundColor(.lightGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
            
//                ProgressBar()x
                
                Spacer()
                
            
                
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .frame(height: 48)
                    .overlay {
                        Text("Готово")
                            .foregroundColor(.darkGreen)
                            .font(.mainRegular())
                            .onTapGesture {
                                changeRootVC()
                            }
                    }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
    
    func changeRootVC() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first?.rootViewController = TabBarVC()
    }
}

struct OnBoarding10View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding10View()
    }
}
