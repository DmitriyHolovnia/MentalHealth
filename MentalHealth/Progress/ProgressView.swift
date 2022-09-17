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
                            .overlay(alignment: .leading) {
                                Text("Прогрес")
                                    .font(.mainRegular(size: 22))
                                    .foregroundColor(.white)
                                    .padding(.leading, 26)
                                    .offset(y: -45)
                            }
                    }
                    
                    Spacer()
                }
                
                ScrollView {
                    Spacer()
                        .frame(height: 100)
                    
                    MoodChart(data: viewModel.chartData)
                        .frame(height: 200)
                        .padding(.horizontal, 15)
                    
                    Spacer()
                }
            }
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
