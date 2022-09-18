//
//  CheckIn2View.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct CheckIn2View: View {
    
    var dismissAction: () -> Void
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
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
                    
                    Text("2/4")
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
                
                Text("Що змушує вас так почуватися?")
                    .font(.mainRegular(size: 22))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                ScrollView {
                    
                    CheckinCellView(text: "Спогади")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 24)
                    
                    CheckinCellView(text: "Новини")
                        .padding(.bottom, 10)
                        .padding(.horizontal, 24)
                    
                    CheckinCellView(text: "Нічні кошмари")
                        .padding(.bottom, 10)
                        .padding(.horizontal, 24)
                    
                    CheckinCellView(text: "Розмови з близькими")
                        .padding(.bottom, 10)
                        .padding(.horizontal, 24)
                    
                    CheckinCellView(text: "Сум за побратимами")
                        .padding(.bottom, 10)
                        .padding(.horizontal, 24)
                    
                    CheckinCellView(text: "Фізичний стан")
                        .padding(.bottom, 10)
                        .padding(.horizontal, 24)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.reallyLightGray)
                            .foregroundColor(.darkGreen)
                        
                        HStack {
                            Image("plus")
                                .resizable()
                                .frame(width: 24, height: 24)
                            
                            Text("Свій варіант")
                                .font(.mainRegular())
                                .foregroundColor(.white)
                        }
                    }
                    .frame(height: 48)
                    .padding(.horizontal, 24)
                }
                
                Spacer()
                
                NavigationLink(destination: CheckIn3View(dismissAction: dismissAction)) {
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

struct CheckIn2View_Previews: PreviewProvider {
    static var previews: some View {
        CheckIn2View(dismissAction: {})
    }
}
