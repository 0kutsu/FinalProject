//
//  Constants.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 4/11/24.
//

import SwiftUI

func colorOpacity(color: Color, opacity: CGFloat) -> Color {
    return color.opacity(opacity)
}

extension Color {
    // og colors
    static let greyBackground = Color("greyBackground")
    static let orangeMain = Color("orangeMain")
    static let orangeFaded50 = Color("orangeFaded50")
    static let orangeFaded25 = Color("orangeFaded25")
    static let greyText = Color("greyText")
    
    // ColorsA
    static let blackA = Color("blackA")
    static let blueA = Color("blueA")
    static let greenA = Color("greenA")
    static let offWhiteA = Color("offWhiteA")
    static let orangeA = Color("orangeA")
    static let pinkA = Color("pinkA")
    static let redA = Color("redA")
    static let grayA = Color("grayA")
    static let lightGrayA = Color("lightGrayA")
    
    static let greenAFaded25 = Color("greenAFaded25")
    
    
    

    // black blue green white orange pink red
    
}


func textFont(name: String, size: CGFloat) -> Font {
    return Font(UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: 50))
}

struct Constants {
    static let textFont: Font = Font(UIFont(name: "Helvetica", size: 50) ?? UIFont.systemFont(ofSize: 50))
}
