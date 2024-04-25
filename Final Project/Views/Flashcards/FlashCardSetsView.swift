//
//  FlashCardSetsView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 4/20/24.
//

import SwiftUI

struct FlashCardSetsView: View {
    @EnvironmentObject var user: User
    var body: some View {
        VStack {
            Text("My Sets")
                .font(.system(size: 40))
                .foregroundColor(Color.orangeMain)
                .padding()
            ZStack {
                Rectangle()
                    .foregroundColor(Color.orange)
                    .frame(height: 100)
                    .cornerRadius(30)
                    .padding(.horizontal, 30)
    
                Text("Create Set")
                    .foregroundColor(Color.orange)
                    .font(.system(size: 20))
                    .fontWeight(.black)
                
            }
            ScrollView(showsIndicators: false) {
                ForEach(user.flashCardSets) { flashCardSet in
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.orange)
                            .frame(height: 100)
                            .cornerRadius(30)
                            .padding(.horizontal, 30)
                        HStack {
                            VStack(alignment: .leading) {
                                Text(flashCardSet.name)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.black)
                                    
                                Text("\(flashCardSet.cards.count) Cards")
                                    .foregroundColor(Color.white)
                                
                            }
                            Spacer()
                                
                        }
                        .padding(.leading, 60)
                        
                            
                    }
                }
                
            }
            Spacer()
            
            
            
        }
        
        
        
    }
}

struct FlashCardSetsView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCardSetsView()
            .environmentObject(User())
    }
}
