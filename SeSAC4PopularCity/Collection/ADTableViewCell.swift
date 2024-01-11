//
//  ADTableViewCell.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell,
                       ConfigureableTravelCellProtocol {
    
    static let identifier = "ADTableViewCell"

    @IBOutlet weak var adTableView: UIView!
    @IBOutlet weak var adDescriptionLabel: UILabel!
    @IBOutlet weak var adCornerView: UIView!
    @IBOutlet weak var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adDescriptionLabel.font = .boldSystemFont(ofSize: 16)
        adDescriptionLabel.numberOfLines = 2
        
        adTableView.backgroundColor = UIColor(red: CGFloat.random(in: 0.8...1), green: CGFloat.random(in: 0.8...1), blue: CGFloat.random(in: 0.8...1), alpha: 1)
        
        adTableView.clipsToBounds = true
        adTableView.layer.cornerRadius = 16
        
        adLabel.text = "AD"
        
        adCornerView.clipsToBounds = true
        adCornerView.layer.cornerRadius = 8
        adCornerView.backgroundColor = .white
    }
    
    func configureCell(data: Travel) {
        adDescriptionLabel.text = data.title
    }
}
