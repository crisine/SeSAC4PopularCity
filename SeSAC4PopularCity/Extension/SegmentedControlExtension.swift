//
//  SegmentedControlExtension.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/10/24.
//

import UIKit

extension UISegmentedControl {
    
    func setupSegmentedControl(titles: [String]) {
        for i in 0..<titles.count {
            self.setTitle(titles[i], forSegmentAt: i)
        }
    }
}
