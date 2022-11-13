//
//  DropDownPopup.swift
//  
//
//  Created by Matt Pfeiffer on 11/7/22.
//

import SwiftUI

#if os(macOS)
struct DropDownPopup<T: Equatable & Hashable & CustomStringConvertible>: View {
    let items: [T]
    let action: (T) -> Void
    @State var hoverItem: T? = nil
    let columns: [GridItem]
    
    init(items: [T], numberOfColumns: Int = 3, action: @escaping (T) -> Void) {
        self.items = items
        self.action = action
        self.columns = Array(repeating: GridItem(), count: numberOfColumns)
    }
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(items, id: \.self) { item in
                Text(item.description)
                    .lineLimit(1)
                    .foregroundColor(item == hoverItem ? Color.white : Color.black)
                    .padding(2)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(item == hoverItem ? Color.blue : Color.white)
                    .onTapGesture {
                        action(item)
                    }
                    .onHover { over in
                        hoverItem = over ? item : nil
                    }
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 6).foregroundColor(.white).shadow(radius: 2))
    }
}
#endif
