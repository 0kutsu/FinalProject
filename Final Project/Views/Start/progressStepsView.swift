//
//  progressStepsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/22/24.
//

import SwiftUI

struct progressStepsView: View {
    var step: Int
    var body: some View {
        if step == 1{
            HStack {
                Image(systemName: "1.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.white)
                //                        .padding(.horizontal, 20)
                
                Rectangle()
                    .frame(width: 40, height: 2)
                    .foregroundColor(Color.white)
                
                Image(systemName: "2.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.white)
                //                        .padding(.horizontal, 20)
                Rectangle()
                    .frame(width: 40, height: 2)
                    .foregroundColor(Color.white)
                
                Image(systemName: "3.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.white)
                //                        .padding(.horizontal, 20)
            }
        }
            
            else {
                HStack {
                    Image(systemName: "1.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color.white)
                    //                        .padding(.horizontal, 20)
                    
                    Rectangle()
                        .frame(width: 40, height: 2)
                        .foregroundColor(Color.white)
                    
                    Image(systemName: "2.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.white)
                    //                        .padding(.horizontal, 20)
                    Rectangle()
                        .frame(width: 40, height: 2)
                        .foregroundColor(Color.white)
                    
                    Image(systemName: "3.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color.white)
                    //                        .padding(.horizontal, 20)
                }
            }
        }
}

struct progressStepsView_Previews: PreviewProvider {
    static var previews: some View {
        progressStepsView(step: 1)
    }
}
