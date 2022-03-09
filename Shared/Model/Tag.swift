//
//  Tag.swift
//  SplitTheBill
//
//  Created by Jannatun Nahar Papia  on 9/3/22.
//

import SwiftUI

//Tag Model..
struct Tag: Identifiable,Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}


