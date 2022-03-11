//
//  Home.swift
//  SplitTheBill
//
//  Created by Jannatun Nahar Papia  on 7/3/22.
//

import SwiftUI

struct Home: View {
    
    @State var text: String = ""
    
    // Tags..
    @State var tags: [Tag] = []
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("Filter \nMenus")
                .font(.system(size: 38, weight: .bold))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity,  alignment: .leading)
            // Custom Tag view...
            TagView(maxLimit: 150, tags: $tags)
            //Default Height...
                .frame(height: 280)
                .padding(.top, 20)
            
            //TextField
            TextField("apple", text: $text)
                .font(.title3)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.white, lineWidth: 1)
                )
            //Setting only Textfield as Dark..
            .environment(\.colorScheme, .dark)
            .padding(.vertical, 18)
            
            // Add Button
            Button {
                addTag(tags: tags, text: text, fontSize: 16, maxLimit: 150) {
                    alert, tag in
                    
                    if alert {
                        // Showing alert
                        showAlert.toggle()
                    }
                    else {
                        //adding Tag...
                        tags.append(tag)
                        text = ""
                    }
                }
                
            } label: {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue.opacity(0.8))
                    .padding(.vertical,12)
                    .padding(.horizontal, 45)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            //Disabling Button...
            .disabled(text == "")
            .opacity(text == "" ? 0.6 : 1)
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.blue.opacity(0.9)
                        .ignoresSafeArea()
        )
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Tag limit Exceeded try to delete some tags !!!"), dismissButton: .destructive(Text("Ok")))
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
