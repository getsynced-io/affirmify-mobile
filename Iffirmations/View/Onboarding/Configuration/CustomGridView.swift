//
//  CustomGridView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 22/02/2023.
//

import SwiftUI


struct CustomGridView: View {
    @Binding var categories : [CategoryModel]
    let n : Int = 11
    @State private var relativePosition: CGFloat = 0.5
    @State var blocker : Bool = false
    var selectedCount : Int {
    
return categories.filter { category in
            category.isSelected
        }.count
    }
    var body: some View {

        ScrollView(.horizontal,showsIndicators: false){
            VStack(spacing: 16){
                ForEach(0..<calculateNumberOfRows(items: categories.count), id: \.self) { rowIndex in
                    HStack(spacing: 16){
                        Spacer(minLength: 0)
                        ForEach(0..<getColomunIndex(rowIndex: rowIndex), id: \.self) { columnIndex in
                            if (getIndex(rowIndex: rowIndex, columnIndex: columnIndex)) < categories.count {
                                categoryCard(categories[getIndex(rowIndex: rowIndex, columnIndex: columnIndex)])
                                    .onTapGesture {
                                        withAnimation {
                                            if selectedCount < 10 {
                                                    categories[getIndex(rowIndex: rowIndex, columnIndex: columnIndex)].isSelected.toggle()
                                            }
                                            else {
                                                if  categories[getIndex(rowIndex: rowIndex, columnIndex: columnIndex)].isSelected {
                                                    categories[getIndex(rowIndex: rowIndex, columnIndex: columnIndex)].isSelected.toggle()
                                                }
                                                else {
                                                    HapticManager.instance.notification(type: .warning)
                                                }
                                            }
                                        }
                                    }
                            }
//                            else {
//                                Spacer(minLength: 0)
//                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .padding( .vertical,16)
        }
       
                .introspectScrollView { scrollView in
                    if !blocker {
                        let width = scrollView.contentSize.width - scrollView.frame.width
                        scrollView.contentOffset.x = relativePosition * width
                        blocker = true
                    }
                }

      
               
    }
    func getColomunIndex(rowIndex : Int )-> Int{
      return  (n - (rowIndex % 2))
    }
    func calculateNumberOfRows(items: Int) -> Int {
        let averageItemsPerRow = Double(n) - 0.5
        let rows = Double(items) / averageItemsPerRow
        return Int(ceil(rows))
    }
    func getIndex(rowIndex : Int , columnIndex : Int)-> Int {
            return  rowIndex * (n - 1) + columnIndex +  (rowIndex - (rowIndex  / 2))
    }
    func categoryCard(_ card : CategoryModel) ->  some View {
        Text("\(card.title.rawValue)")
            .customFont(font: .IBMPlexSerifRegular, size: 16, color: card.isSelected ?  ._FFFFFF : ._000000)
            .background(
                Group{
                        Capsule()
                            .if(!card.isSelected, transform: { view in
                                view
                                    .strokeBorder(lineWidth: 1)
                            })
                            .foregroundColor(._000000)
                            .frame(width: 128, height: 48)

                }
            )
            .frame(width: 128, height: 48)
    }
 
}
