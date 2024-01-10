//
//  UICollectionViewFlowLayoutExtension.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/10/24.
//

import UIKit

extension UICollectionViewFlowLayout {
    
    func setupLayout() {
        self.itemSize = CGSize(width: 160, height: 220)
        self.minimumLineSpacing = 5
        self.minimumInteritemSpacing = 0
        self.sectionInset = UIEdgeInsets(top: 8, left: 32, bottom: 0, right: 32)
        self.scrollDirection = .vertical
    }
}
