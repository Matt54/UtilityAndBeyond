//
//  DropDownControl.swift
//  
//
//  Created by Matt Pfeiffer on 11/7/22.
//

import SwiftUI

#if os(macOS)
struct DropDownControl<T: Equatable & Hashable & CustomStringConvertible>: View {
    var selectionTitle: String?
    let items: [T]
    let title: String
    var numberOfColumns: Int = 3
    var showsIndicator: Bool = true
    var isInverted: Bool = false
    @State private var dropDownShown: Bool = false
    var selectionAction: (T) -> Void
    
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack {
            
            if !title.isEmpty {
                Text(title)
                    .bold()
            }
            
            Spacer()
            if let title = selectionTitle {
                Text(title)
                    .padding(.horizontal, 8)
                    .font(.title3)
            }
            
            if title.isEmpty {
                Spacer()
            }
            
            if showsIndicator {
                Image(systemName: dropDownShown ? "arrowtriangle.down.fill" : "arrowtriangle.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10)
            }
        }
        .font(.title3)
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
        .background(
            RoundedRectangle(cornerRadius: 12).fill(Color.controlColor)
                .shadow(color: .shadowColor, radius: 1, x: 0.25, y: 0.5)
        )
        .contentShape(Rectangle())
        .overlay (
            VStack {
                if dropDownShown {
                    if !isInverted {
                        Spacer(minLength: 35)
                    }
                    
                    DropDownPopup<T>(items: items, numberOfColumns: numberOfColumns) { item in
                        selectionAction(item)
                        dropDownShown.toggle()
                    }
                    
                    if isInverted {
                        Spacer(minLength: 35)
                    }
                }
            }, alignment: isInverted ? .bottomLeading : .topLeading
        )
        .onTapGesture {
            dropDownShown.toggle()
        }
        .zIndex(dropDownShown ? 1 : 0)
    }
}
#endif
