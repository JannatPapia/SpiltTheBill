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
    
        //Adding Geometry Effect to tag.....
    @Namespace var animation
    
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

                HStack(spacing: 6) {
                    
                    ForEach(rows) { row in
                        
                        //Row View....
                        RowView(tag: row)
                    }
                }
            }
            }
            .frame(width: UIScreen.main.bounds.width - 80, alignment: .leading)
            .padding(.vertical)
            .padding(.bottom,20)
        }
        .frame(maxWidth: .infinity)
        .background(
            
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.black.opacity(0.5), lineWidth: 1)
        )
            //Animation...
            .animation(.easeInOut, value: tags)
        .overlay(
        
            // Limit ....
            Text("\(getSize(tags: tags))/\(maxLimit)")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(Color.pink)
                .padding(12),
            
            alignment: .bottomTrailing
        )
    }
//        // Since onChange will perform little late...
//        .onChange(of: tags) { newValue in

//            //getting newly inserted Value....
//            guard let last = tags.last else {
//                return
//            }
//            //getting Text Size...
//            let font = UIFont.systemFont(ofSize: fontSize)
//
//            let attributes = [NSAttributedString.Key.font: font]
//            let size = (last.text as NSString).size(withAttributes: attributes)
//
//            //Updating Size...
//            tags[getIndex(tag: last)].size = size.width
// //           print(size)
 //       }
//        //Animation...
//        .animation(.easeInOut, value: tags)
    }
    
    @ViewBuilder
    func RowView(tag: Tag)-> some View {
        Text(tag.text)
        // apllying some font size...
        //else size will vary..
            .font(.system(size: fontSize))
        //adding capsule ....
            .padding(.horizontal,14)
            .padding(.vertical)
            .background(
                
                Capsule()
                    .fill(Color.white)
            
            )
            .foregroundColor(Color.blue)
            .lineLimit(1)
        //Delete...
            .contentShape(Capsule())
            .contextMenu{
                Button("Delete") {
                    //deleting ...
                    tags.remove(at: getIndex(tag: tag))
                }
            }
            .matchedGeometryEffect(id: tag.id, in: animation)
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
        
        //adding the capsule size into total width with spacing....
        //14 + 14 + 6 + 6
        //extra 6 for safety....
        totalWidth += (tag.size + 40)
        
        //checking if totalwidth is greater than size...
        if totalWidth > screenWidth {
            
            //adding row in rows..
            //clearing the data..
 //           totalWidth = 0
            totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (tag.size + 40) : 0)
            
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

//Global  Function....
func addTag(tags: [Tag],text: String, fontSize: CGFloat,maxLimit: Int, completion: @escaping(Bool,Tag)-> ()){
    
    // getting text size...
                //getting Text Size...
    let font = UIFont.systemFont(ofSize: fontSize)
    
    let attributes = [NSAttributedString.Key.font: font]
    
    let size = (text as NSString).size(withAttributes: attributes)
    
    let tag = Tag(text: text, size: size.width)
    
    if (getSize(tags: tags) + text.count) < maxLimit {
        completion(false,tag)
    } else {
        completion(true, tag)
    }
                //Updating Size...
//    return Tag(text: text, size: size.width)
}


func getSize(tags: [Tag]) -> Int{
    var count: Int = 0
    
    tags.forEach{ tag in
        count += tag.text.count
    }
    return count
}

