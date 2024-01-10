//
//  ImageViewExtension.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/10/24.
//

import UIKit

extension UIImageView {
    
    func setupImageView() {
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
