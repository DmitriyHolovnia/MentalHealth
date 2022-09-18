//
//  CheckInView.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct CheckInView: View {
    
    var dismissAction: () -> Void
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.darkGreen.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Image("cross")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.leading, 26)
                            .hidden()
                        
                        Spacer()
                        
                        Text("1/4")
                            .font(.mainLight())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image("cross")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.trailing, 26)
                            .onTapGesture {
                                dismissAction()
                            }
                    }
                    .padding(.top, 20)
                    
                    ScrollView {
                        Image("checkin-cookie")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 95)
                            .padding(.top, 24)
                        
                        Text("Як почуваєтеся?")
                            .font(.mainRegular(size: 24))
                            .foregroundColor(.white)
                            .padding(.top, 24)
                        
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 126, height: 42)
                            .foregroundColor(.midGreen)
                            .overlay {
                                HStack(spacing: 5) {
                                    Image("calendar")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                    
                                    Text("Сьогодні")
                                        .font(.mainLight())
                                        .foregroundColor(.white)
                                }
                            }
                        
                        HStack(spacing: 10) {
                            CheckinCellView(text: "Впевнено")
                                .frame(width: 105)
                            
                            CheckinCellView(text: "Самотньо")
                                .frame(width: 100)
                        }
                        .padding(.top, 30)
                        
                        HStack(spacing: 10) {
                            CheckinCellView(text: "Стомлено")
                                .frame(width: 100)
                            
                            CheckinCellView(text: "Розгублено")
                                .frame(width: 120)
                        }
                        .padding(.top, 10)
                        
                        HStack(spacing: 10) {
                            CheckinCellView(text: "Роздратовано")
                                .frame(width: 140)
                            
                            CheckinCellView(text: "Спокійно")
                                .frame(width: 120)
                        }
                        .padding(.top, 10)
                        
                        HStack(spacing: 10) {
                            CheckinCellView(text: "Тривожно")
                                .frame(width: 110)
                            
                            CheckinCellView(text: "Щасливо")
                                .frame(width: 120)
                            
                            CheckinCellView(text: "Безпечно")
                                .frame(width: 110)
                        }
                        .padding(.top, 10)
                        
                        HStack(spacing: 10) {
                            CheckinCellView(text: "Розслаблено")
                                .frame(width: 120)
                            
                            CheckinCellView(text: "Натхненно")
                                .frame(width: 110)
                        }
                        .padding(.top, 10)
                    }
                    
                    NavigationLink(destination: CheckIn2View(dismissAction: dismissAction)) {
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
        }
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView(dismissAction: {})
    }
}
