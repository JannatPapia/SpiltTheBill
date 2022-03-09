//
//  TagView.swift
//  SplitTheBill
//
//  Created by Jannatun Nahar Papia  on 9/3/22.
//

import SwiftUI

//Custom View......
struct TagView: View {
    var maxLimit: Int
    @Binding var tags: [Tag]
    var title: String = "Add Some Tags"
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(title)
                .font(.callout)
                .foregroundColor(Color.white)
        // ScrollView..
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity)
        .background(
            
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.black.opacity(0.5), lineWidth: 1)
        )
    }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
