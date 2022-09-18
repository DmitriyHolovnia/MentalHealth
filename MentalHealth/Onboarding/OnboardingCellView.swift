//
//  OnboardingCellView.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct OnboardingCellView: View {
    
    @Binding var selectedTag: Int
    var tag: Int
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(selectedTag == tag ? .lightGreen : .clear)
            
            RoundedRectangle(cornerRadius: 24)
                .stroke(selectedTag == tag ? Color.darkGreen : Color.lightGray)
            
            
            Text(text)
                .font(.mainUltraLight())
                .foregroundColor(.black)
        }
        .onTapGesture {
            selectedTag = tag
        }
        .frame(height: 48)
    }
}

struct OnboardingCellView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCellView(selectedTag: .constant(0), tag: 0, text: "Test")
    }
}
