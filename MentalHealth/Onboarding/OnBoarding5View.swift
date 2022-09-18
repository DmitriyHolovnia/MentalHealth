//
//  OnBoarding5View.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct OnBoarding5View: View {
    
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
                
                Spacer()
                
                Image("onboarding-1")
                    .padding(.bottom, 40)

                
                Text("Майже готово!")
                    .font(.mainRegular(size: 22))
                    .foregroundColor(.white)

                Text("Відповіді на питання допоможуть сформувати більш ефективну і персоналізовану програму")
                    .font(.mainLight())
                    .foregroundColor(.reallyLightGray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    .padding(.bottom, 90)
                    .lineSpacing(5)
                
                Spacer()
                
                NavigationLink(destination: OnBoarding6View()) {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .frame(height: 48)
                        .overlay {
                            Text("Продовжити")
                                .foregroundColor(.darkGreen)
                                .font(.mainRegular())
                        }
                }
                
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

struct OnBoarding5View_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding5View()
    }
}
