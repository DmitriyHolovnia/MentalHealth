//
//  CheckinCellView.swift
//  MentalHealth
//
//  Created by Dmitriy Holovnia on 18.09.2022.
//

import SwiftUI

struct CheckinCellView: View {
    
    @State var isSelected = false
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(isSelected ? .midGreen : .darkGreen)
            
            RoundedRectangle(cornerRadius: 24)
                .stroke(isSelected ? Color.white : Color.reallyLightGray)
            
            
            Text(text)
                .font(.mainRegular())
                .foregroundColor(.white)
        }
        .onTapGesture {
            isSelected.toggle()
        }
        .frame(height: 48)
    }
}

struct CheckinCellView_Previews: PreviewProvider {
    static var previews: some View {
        CheckinCellView(text: "Test")
    }
}
