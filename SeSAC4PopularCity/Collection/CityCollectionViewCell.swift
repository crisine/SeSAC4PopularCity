//
//  CityCollectionViewCell.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/9/24.
//

import UIKit
import Kingfisher

class CityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        
        subtitleLabel.font = .systemFont(ofSize: 12)
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .gray
        
        imageView.setupImageView()
    }
    
    func configureCell(data: City) {
        titleLabel.text = "\(data.city_name) | \(data.city_english_name)"
        subtitleLabel.text = data.city_explain
        
        let imageUrl = URL(string: data.city_image)
        imageView.kf.setImage(with: imageUrl)
    }
}
