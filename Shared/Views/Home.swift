//
//  Home.swift
//  SplitTheBill
//
//  Created by Jannatun Nahar Papia  on 7/3/22.
//

import SwiftUI

struct Home: View {
    
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Text("Filter \nMenus")
                .font(.system(size: 38, weight: .bold))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity,  alignment: .leading)
            // Custom Tag view...
            
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
            .padding(.vertical, 12)
            
            // Add Button
            Button {
                
            } label: {
                Text("Add Tag")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue.opacity(0.8))
                    .padding(.vertical,12)
                    .padding(.horizontal, 45)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.blue.opacity(0.9)
                        .ignoresSafeArea()
        )
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
