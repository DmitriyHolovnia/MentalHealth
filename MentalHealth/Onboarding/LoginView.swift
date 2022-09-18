//
//  LoginView.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        NavigationView {
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
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    Image("login-image")
                        .padding(.bottom, 40)
                    
                    Text("Допомагаємо\nветеранам відновитися. Підтримуємо. ")
                        .font(.mainRegular(size: 22))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 24)
                        .frame(height: 48)
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .overlay {
                            Text("Рєстрація з e-mail")
                                .font(.mainRegular())
                                .foregroundColor(.darkGreen)
                        }
                        .padding(.bottom, 16)
                    
                    RoundedRectangle(cornerRadius: 24)
                        .frame(height: 48)
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                        .overlay {
                            HStack {
                                Image("google")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                                Text("Рєстрація з Google")
                                    .font(.mainRegular())
                                    .foregroundColor(.darkGreen)
                            }
                        }
                        .padding(.bottom, 24)
                    
                    HStack(spacing: 3) {
                        Text("Вже зареєстровані?")
                            .font(.mainRegular())
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: OnBoardingView()) {
                            Text("Увійти")
                                .font(.mainRegular())
                                .foregroundColor(.white)
                                .underline(color: .white)
                        }
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
