//
//  ProfileView.swift
//  Final Project
//
//  Created by Jamie Oswald (student LM) on 5/22/24.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseAuth
import FirebaseDatabase


struct ProfileView: View {
    
    @EnvironmentObject var user: User
    @State var showSheet = false
    @State var selectionType: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.orangeMain.opacity(0.2))
                    .ignoresSafeArea(.all)
                    .frame(maxHeight: 120)
                
                Image(uiImage: self.user.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding(.horizontal, 140)
                    .padding(.top, 120)
                
                Button {
                    showSheet.toggle()
                    
                } label: {
                    ZStack {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                            .padding(.all, 4)
                            .background(.white)
                            .clipShape(Circle())
                            .padding(.top, 195)
                            .padding(.leading, 95)
                            .shadow(radius: 2, y: 1)
                            .font(.title3)
                    }
                    
                }
                
                
               
                
            }.padding(.top, -100)
            
            Text("Name")
                .padding(.trailing, 220)
                .font(.title)
                .foregroundColor(.black)
                .bold()
            
            Text("Learning Spanish")
                . padding(.trailing, 167)
            
            Spacer()
            
            ZStack{
//                Rectangle()
//                    .foregroundColor(.lightGrayA)
//                    .cornerRadius(30)
//                    .padding(.horizontal, 40)
//                    .padding(.top, 10)
                
                VStack{
                    HStack{
                        Text("Preferences")
                            .font(.title3)
                        
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.right.fill" )
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 35)
                    
                    HStack{
                        Text("Account")
                            .font(.title3)
                        
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.right.fill" )
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 35)
                    
                    HStack{
                        Text("Notifications")
                            .font(.title3)
                        
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.right.fill" )
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 35)
                    
                    HStack{
                        Text("Privacy")
                            .font(.title3)
                        
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.right.fill" )
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 35)
                    
                    HStack{
                        Text("Help")
                            .font(.title3)
                        
                        Spacer()
                        
                        Image(systemName: "arrowtriangle.right.fill" )
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .background(.white)
                    .cornerRadius(25)
                    .shadow(radius: 2, y: 1)
                    .padding(.horizontal, 35)
                    
                    
                    
                    
                    Spacer()
                }
                .padding(.top, 40)
               
                
                    
                  
            }
            
            
            
            
        } .sheet(isPresented: $showSheet, onDismiss: {
                        //get the user's uid because their image will be stored in a bucket that is identified by the key
                        guard let uid = Auth.auth().currentUser?.uid else {
                            print("user not logged in")
                            return
                        }
        
                        //compress the image - there's a maximum size that can be stored, and convert from .jpeg to imageData
                        guard let imageData = self.user.image.jpegData(compressionQuality: 0.5) else {
                            print("failed to convert image")
                            return
                        }
        
                        Storage.storage().reference().child("users/\(uid)").putData(imageData) { meta, error in
                            if let metaData = meta {
                                Storage.storage().reference().child("users/\(uid)").downloadURL { url, error in
                                    if let u = url {
                                        Database.database().reference().child("users/\(uid)").updateChildValues(["imagePath": u.absoluteString])
                                    }
        
                                }
                            }
        
                        }
        
                    }, content: {
                        ImagePicker(selectedImage: self.$user.image)
                    })
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(User())
    }
}
