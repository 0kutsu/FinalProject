//
//  UnderLineTextFieldView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 6/3/24.
//

import SwiftUI


struct UnderLineTextFieldView: View {
    @Binding var text: String
    let secureField: Bool
    @State var defaultLineColor: Color
    @State var activeLineColor: Color
    let lineThickness: CGFloat
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 25)
                .foregroundColor(defaultLineColor)
                .offset(y: lineThickness)
            
            Rectangle()
                .frame(height: 25)
                .foregroundColor(Color.white)
            
            if !secureField {
                TextField("", text: $text)
                    .font(textFont(name: "helvetica", size: 20))
                    .foregroundColor(Color.blackA)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onTapGesture {
                        defaultLineColor = activeLineColor
                    }
                
            }
            else {
                SecureField("", text: $text)
                    .font(textFont(name: "helvetica", size: 20))
                    .foregroundColor(Color.blackA)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onTapGesture {
                        defaultLineColor = activeLineColor
                    }
            }
        }
    }
}

struct UnderLineTextFieldView_Preview: PreviewProvider {
    static var previews: some View {
        UnderLineTextFieldView(text: Binding.constant("ABC"), secureField: false, defaultLineColor: Color.lightGrayA, activeLineColor: Color.orangeA, lineThickness: 2)
    }
}
