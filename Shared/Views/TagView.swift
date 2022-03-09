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
    var fontSize: CGFloat = 16
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(title)
                .font(.callout)
                .foregroundColor(Color.white)
        // ScrollView..
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                
                //Displaying Tags.....
                ForEach(getRows(),id: \.self) { rows in

                HStack(spacing: 0) {
                    
                    ForEach(rows) { row in
                        
                        //Row View....
                        RowView(tag: row)
                    }
                }
            }
            }
            .frame(width: UIScreen.main.bounds.width - 80, alignment: .leading)
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity)
        .background(
            
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.black.opacity(0.5), lineWidth: 1)
        )
    }
        .onChange(of: tags) { newValue in
            
            //getting newly inserted Value....
            guard let last = tags.last else {
                return
            }
            //getting Text Size...
            let font = UIFont.systemFont(ofSize: fontSize)
            
            let attributes = [NSAttributedString.Key.font: font]
            let size = (last.text as NSString).size(withAttributes: attributes)
            
            //Updating Size...
            tags[getIndex(tag: last)].size = size.width
 //           print(size)
        }
    }
    
    @ViewBuilder
    func RowView(tag: Tag)-> some View {
        Text(tag.text)
    }
    func getIndex(tag: Tag)-> Int {
        
        let index = tags.firstIndex{ currentTag in
            return tag.id == currentTag.id
        } ?? 0
        return index
    }

func getRows()-> [[Tag]] {
    
    var rows: [[Tag]] = []
    var currentRow: [Tag] = []
    
    //calculating text width...
    var totalWidth: CGFloat = 0
    
    //For safety extra 10....
    let screenWidth: CGFloat = UIScreen.main.bounds.width - 90
    
    tags.forEach { tag in
        //updating total width...
        totalWidth += tag.size
        
        //checking if totalwidth is greater than size...
        if totalWidth > screenWidth {
            
            //adding row in rows..
            //clearing the data..
            rows.append(currentRow)
            currentRow.removeAll()
            currentRow.append(tag)
        }
        else {
            currentRow.append(tag)
        }
    }
    
    //Safe check...
    //if having any value storing it in rows...
    if !currentRow.isEmpty{
        rows.append(currentRow)
        currentRow.removeAll()
    }
    
    return rows
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
