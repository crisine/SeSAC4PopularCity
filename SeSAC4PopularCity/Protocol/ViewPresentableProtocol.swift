//
//  ViewPresentableProtocol.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/10/24.
//

import UIKit

@objc
protocol ViewPresentableProtocol {
    
    var navigationTitleString: String { get }
    var backGroundColor: UIColor { get }
    static var identifier: String { get }
    
    func configureView()
    @objc optional func configureLabel()
    @objc optional func configureTextField()
}
