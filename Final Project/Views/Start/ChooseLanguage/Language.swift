//
//  Language.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/22/24.
//

import SwiftUI

class Language: Identifiable {
    let name: String
    let nativeName: String
    let flag: Image
    let selected = false
    @Published var uid: String = ""
    
    init(name: String, nativeName: String) {
        self.name = name
        self.nativeName = nativeName
        flag = Image(name)
        
    }
    
}
