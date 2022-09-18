//
//  CheckIn4View.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct CheckIn4View: View {
    
    var dismissAction: () -> Void
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var text = ""
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
                    
                    Text("4/4")
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
                
                Text("Додайте нотатку про те,\nяк пройшов ваш день")
                    .font(.mainRegular(size: 22))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                
                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 28)
                    .frame(height: 160)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.reallyLightGray.opacity(0.8))
                            .padding(.horizontal, 24)
                    )
                    .overlay(alignment: .bottomTrailing) {
                        Text("200")
                            .foregroundColor(.white)
                            .font(.mainLight())
                            .padding(.trailing, 33)
                            .padding(.bottom, 10)
                    }
                
                Spacer()
                
                
                RoundedRectangle(cornerRadius: 24)
                    .foregroundColor(.white)
                    .padding(.horizontal, 24)
                    .frame(height: 48)
                    .overlay {
                        Text("Закiнчити")
                            .foregroundColor(.darkGreen)
                            .font(.mainRegular())
                    }
                    .onTapGesture {
                        dismissAction()
                    }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

struct CheckIn4View_Previews: PreviewProvider {
    static var previews: some View {
        CheckIn4View(dismissAction: {})
    }
}
