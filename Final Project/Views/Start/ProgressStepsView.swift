//
//  progressStepsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/22/24.
//

import SwiftUI

struct ProgressStepsView: View {
    var step: Int
    var white: Bool
    var body: some View {
        if step == 1{
            HStack {
                Image(systemName: "1.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(width: 40, height: 2)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                
                Image(systemName: "2.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
                Rectangle()
                    .frame(width: 40, height: 2)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                
                Image(systemName: "3.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
            }
        }
        
        else if step == 2 {
            HStack {
                Image(systemName: "1.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(width: 40, height: 2)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                
                Image(systemName: "2.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
                Rectangle()
                    .frame(width: 40, height: 2)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                
                Image(systemName: "3.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
            }
        }
        
        else {
            HStack {
                Image(systemName: "1.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(width: 40, height: 2)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                
                Image(systemName: "2.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
                Rectangle()
                    .frame(width: 40, height: 2)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                
                Image(systemName: "3.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(white == true ? Color.white : Color.orangeMain)
                //                        .padding(.horizontal, 20)
            }
        }
    }
}

struct ProgressStepsView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressStepsView(step: 1, white: false)
    }
}
