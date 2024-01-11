//
//  TouristSpotTableViewCell.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/11/24.
//

import UIKit

class TouristSpotTableViewCell: UITableViewCell,
                                ConfigureableTravelCellProtocol {
    
    static let identifier = "TouristSpotTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var favLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var heartFavButton: UIButton!
    @IBOutlet weak var subView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        subView.backgroundColor = .clear
        
        thumbnailView.clipsToBounds = true
        thumbnailView.layer.cornerRadius = 8
        thumbnailView.contentMode = .scaleAspectFill
        
        titleLabel.font = .boldSystemFont(ofSize: 14)
        
        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 3
        
        starLabel.font = .systemFont(ofSize: 10)
        starLabel.textColor = .lightGray
        
        favLabel.font = .systemFont(ofSize: 10)
        favLabel.textColor = .lightGray
        
        heartFavButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartFavButton.backgroundColor = .clear
        heartFavButton.tintColor = .white
    }
    
    func configureCell(data: Travel) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        
        var starString = ""
        
        for i in 1...5 {
            if Int(data.grade ?? 0) - i < 0 {
                starString.append("☆")
            } else {
                starString.append("★")
            }
        }
        
        starLabel.text = "\(starString) (\(String(data.grade ?? 0)))"
        favLabel.text = "· 저장 \(convertPlainIntToCommaFormattedString(number: data.save ?? 0))"
        
        if let urlString = data.travel_image {
            let imageUrl = URL(string: urlString)
            thumbnailView.kf.setImage(with: imageUrl)
        }
        
    }
    
    func convertPlainIntToCommaFormattedString(number: Int) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: number)!
    }
}
