//
//  HomeNavigationBarView.swift
//  Final Project
//
//  Created by Mati Okutsu (student LM) on 5/17/24.
//

import SwiftUI

struct HomeNavigationBarView: View {
    @Binding var viewState: ViewState
    var body: some View {
        HStack{
            //home button
            Button {
                viewState = .home
            } label: {
                VStack {
                    Image(systemName: viewState == .home ? "house.fill" : "house")
                        .font(.title)
                    .foregroundColor(Color.lightGrayA)
                    
                    Text("Home")
                        .foregroundColor(Color.lightGrayA)
                        .font(textFont(name: "helvetica-bold", size: 15))
                }
                    
            }
            Spacer()
            //chat
            Button {
                viewState = .chat
            } label: {
                VStack {
                    Image(systemName: viewState == .chat ? "message.fill" : "message")
                        .font(.title)
                    .foregroundColor(Color.lightGrayA)
                    
                    Text("Chat")
                        .foregroundColor(Color.lightGrayA)
                        .font(textFont(name: "helvetica-bold", size: 15))
                }
                    
            }
            
            Spacer()
            
            //flashcards
            Button {
                viewState = .flashcards
            } label: {
                VStack {
                    Image(systemName: viewState == .flashcards ? "archivebox.fill" : "archivebox")
                        .font(.title)
                    .foregroundColor(Color.lightGrayA)
                    
                    Text("Study")
                        .foregroundColor(Color.lightGrayA)
                        .font(textFont(name: "helvetica-bold", size: 15))
                }
                    
            }
           
            Spacer()
            
            //settings
            Button {
                viewState = .profile
            } label: {
                VStack {
                    Image(systemName: viewState == .profile ? "person.fill" : "person")
                        .font(.title)
                    .foregroundColor(Color.lightGrayA)
                    
                    Text("Profile")
                        .foregroundColor(Color.lightGrayA)
                        .font(textFont(name: "helvetica-bold", size: 15))
                }
                    
            }
        }
        
        .padding(.horizontal, 30)
        .padding(.top, 5)
        
//        //  testing
//        .background(Color.blackA)
        .background(Color.white)
//
//        .clipShape(TopRoundedRectangle(cornerRadius: 30))
    }
}

struct HomeNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNavigationBarView(viewState: Binding.constant(.home))
    }
}
