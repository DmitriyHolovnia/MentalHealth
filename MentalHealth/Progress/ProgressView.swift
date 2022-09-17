//
//  ProgressView.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 17.09.2022.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        ScrollView {
            MoodChart()
                .frame(height: 200)
                .padding(.horizontal, 15)
            
            Circle()
                .foregroundColor(.yellow)
            
            Spacer()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
