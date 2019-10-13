//
//  StaggeredLayout.swift
//  StaggeredList
//
//  Created by Alfian Losari on 13/10/19.
//  Copyright © 2019 Alfian Losari. All rights reserved.
//

import SwiftUI

struct StaggeredLayout {
    
    let containerSize: CGSize
    let numberOfColumns: Int
    let columnWidth: CGFloat
    let xOffsets: [CGFloat]
    var maxY: CGFloat = 0
    private var currentColumn = 0
    private var yOffsets = [CGFloat]()

    private let sectionInset: NSEdgeInsets
    private let horizontalSpacing: CGFloat
    private let verticalSpacing: CGFloat
    
    init(containerSize: CGSize, numberOfColumns: Int = 2, horizontalSpacing: CGFloat = 2, verticalSpacing: CGFloat = 2, sectionInset: NSEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)) {
        assert(numberOfColumns > 0, "Number of columns minimal is 1")
        
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.sectionInset = sectionInset
        self.containerSize = containerSize
        self.numberOfColumns = numberOfColumns
        
        let totalHorizontalSpacingWidth = CGFloat(numberOfColumns - 1) * horizontalSpacing
        let insetsWidth = sectionInset.left + sectionInset.right
        columnWidth = (containerSize.width - totalHorizontalSpacingWidth - insetsWidth) / CGFloat(numberOfColumns)
        var xOffsets = [CGFloat]()
        var x: CGFloat = 0
        
        for col in 0..<numberOfColumns {
            x = sectionInset.left + (CGFloat(col) * (columnWidth + horizontalSpacing))
            xOffsets.append(x)
        }
        
        self.xOffsets = xOffsets
        self.yOffsets = .init(repeating: sectionInset.top, count: numberOfColumns)
    }
    
    mutating func add(element size: CGSize) -> CGRect {
        if currentColumn > numberOfColumns - 1 {
            currentColumn = 0
        }
        
        defer {
            currentColumn += 1
        }
        
        let y = yOffsets[currentColumn]
        yOffsets[currentColumn] = y + size.height + verticalSpacing
        maxY = max(maxY, yOffsets[currentColumn])
        return CGRect(x: xOffsets[currentColumn], y: y, width: columnWidth, height: size.height)
    }
    
    var size: CGSize {
        return CGSize(width: containerSize.width, height: maxY + sectionInset.bottom)
    }
}
