//
//  TouristSpotViewController.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/12/24.
//

import UIKit

class TouristSpotViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "TouristSpotViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = "관광지 화면"
        descriptionLabel.font = .boldSystemFont(ofSize: 48)
        descriptionLabel.textAlignment = .center
        
        navigationItem.title = "관광지 화면"
    }
    
}
