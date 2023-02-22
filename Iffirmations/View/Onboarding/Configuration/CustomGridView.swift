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
    var body: some View {

        ScrollView(.horizontal,showsIndicators: false){
            VStack(spacing: 16){
                ForEach(0..<calculateNumberOfRows(items: categories.count), id: \.self) { rowIndex in
                    HStack(spacing: 16){
                        ForEach(0..<getColomunIndex(rowIndex: rowIndex), id: \.self) { columnIndex in
                            if (getIndex(rowIndex: rowIndex, columnIndex: columnIndex)) < categories.count {
                                categoryCard(categories[getIndex(rowIndex: rowIndex, columnIndex: columnIndex)])
                            } else {
                                Spacer(minLength: 0)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal , 16)
        }
    }
    func getColomunIndex(rowIndex : Int )-> Int{
        print("(n - (rowIndex % 2)) \(n - (rowIndex % 2))")
      return  (n - (rowIndex % 2))
    }
    func calculateNumberOfRows(items: Int) -> Int {
        let averageItemsPerRow = Double(n) - 0.5
        let rows = Double(items) / averageItemsPerRow
        return Int(ceil(rows))
    }
    func getIndex(rowIndex : Int , columnIndex : Int)-> Int {
        print("rowIndex * n + columnIndex \(rowIndex * n + columnIndex)")
        print("rowIndex \(rowIndex) ,columnIndex \(columnIndex)")

            return  rowIndex * (n - 1) + columnIndex +  (rowIndex - (rowIndex  / 2))
    }
    func categoryCard(_ card : CategoryModel) ->  some View {
        Text("\(card.title)")
            .customFont(font: .IBMPlexSerifRegular, size: 16, color: ._000000)
            .background(
            Capsule()
                .stroke(lineWidth: 1)
                .foregroundColor(._000000)
                .frame(width: 128, height: 48)
                
            
            )
            .frame(width: 128, height: 48)
    }
 
}
