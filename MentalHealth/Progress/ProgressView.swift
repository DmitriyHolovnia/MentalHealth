//
//  ProgressView.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import SwiftUI

struct ProgressView: View {
    
    @EnvironmentObject var viewModel: ProgressViewModel
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    ZStack {
                        Image("header")
                            .resizable()
                            .frame(width: proxy.size.width, height: proxy.size.width * 0.41)
                            .scaledToFill()
                            .ignoresSafeArea()
                            .overlay(alignment: .center) {
                                HStack {
                                    Text("Прогрес")
                                        .font(.mainRegular(size: 22))
                                        .foregroundColor(.white)
                                        .padding(.leading, 26)
                                        .offset(y: -45)
                                    
                                    Spacer()
                                    
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .foregroundColor(.midGreen)
                                        
                                        Image("settings")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16)
                                        
                                    }
                                    .frame(width: 36, height: 36)
                                    .padding(.trailing, 20)
                                    .offset(y: -45)
                                }
                            }
                    }
                    
                    Spacer()
                }
                
                ScrollView(showsIndicators: false) {
                    Spacer()
                        .frame(height: 70)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.lightGreen)
                            .frame(height: 125)
                        
                        HStack {
                            VStack {
                                HStack {
                                    Text("Додайте Apple Health ")
                                        .font(.mainRegular(size: 18))
                                        .padding(.bottom, 8)
                                    
                                    Spacer()
                                }
                                HStack {
                                    Text("Дізнавайтеся як активність\nвпливає на ваш настрій")
                                        .font(.mainLight())
                                        .foregroundColor(.lightGray)
                                        .padding(.bottom, 8)
                                        .lineSpacing(5)
                                    
                                    Spacer()
                                }
                            }
                            .padding(.leading, 20)
                            
                            Spacer()
                            
                            VStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .foregroundColor(.white)
                                    .frame(width: 48, height: 48)
                                    .padding(.top, 20)
                                    .padding(.trailing, 20)
                                    .overlay {
                                        Image("health")
                                            .resizable()
                                            .frame(width: 23, height: 20)
                                            .padding(.top, 4)
                                            .padding(.trailing, 4)
                                    }
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.mainGray)
                            .frame(height: 200)
                        
                        VStack(alignment: .leading) {
                            Text("Тенденції настрою")
                                .padding(.horizontal, 20)
                                .font(.mainRegular(size: 18))
                                .padding(.top, 20)
                                .padding(.bottom, 2)
                            
                            Text("За період 10.09-18.09")
                                .padding(.horizontal, 20)
                                .font(.mainRegular())
                                .foregroundColor(.lightGray)
                            
                            Spacer()
                            
                            Image("graph")
                                .resizable()
                                .scaledToFit()
                                .padding(.horizontal, 20)
                                .padding(.bottom, 20)
                        }
                    }
                    .padding(.bottom, 20)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.mainGray)
                            .frame(height: 220)
                        
                        VStack(alignment: .leading) {
                            Text("Зміни емоцій")
                                .padding(.horizontal, 20)
                                .font(.mainRegular(size: 18))
                                .padding(.top, 20)
                                .padding(.bottom, 2)
                            
                            Text("Порівняно з минулим тижнем")
                                .padding(.horizontal, 20)
                                .font(.mainRegular())
                                .foregroundColor(.lightGray)
                            
                            Spacer()
                            
                            HStack(spacing: 10) {
                                Image("mood-graph")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16)
                                
                                Image("mood-graph-2")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.bottom, 8)
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 19)
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
