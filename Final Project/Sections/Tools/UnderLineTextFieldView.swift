//
//  UnderLineTextFieldView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 6/3/24.
//

import SwiftUI


struct UnderLineTextFieldView: View {
    @Binding var text: String
    let textDescription: String
    let secureField: Bool
    let size: CGFloat
    @State var defaultLineColor: Color
    @State var activeLineColor: Color
    let lineThickness: CGFloat
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: size+5)
                .foregroundColor(defaultLineColor)
                .offset(y: lineThickness)
            
            Rectangle()
                .frame(height: size+5)
                .foregroundColor(Color.white)
            
            if !secureField {
                TextField(textDescription, text: $text)
                    .font(textFont(name: "helvetica", size: size))
                    .foregroundColor(Color.blackA)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .onTapGesture {
                        defaultLineColor = activeLineColor
                    }
                
            }
            else {
                SecureField("", text: $text)
                    .font(textFont(name: "helvetica", size: size))
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
        UnderLineTextFieldView(text: Binding.constant("ABC"), textDescription: "", secureField: false, size: 20, defaultLineColor: Color.lightGrayA, activeLineColor: Color.orangeA, lineThickness: 2)
    }
}
