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
        ScrollView {
            MoodChart(data: viewModel.chartData)
                .frame(height: 200)
                .padding(.horizontal, 15)
            
            Spacer()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
