//
//  ADViewController.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/12/24.
//

import UIKit

class ADViewController: UIViewController {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static let identifier = "ADViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = .boldSystemFont(ofSize: 48)
        descriptionLabel.text = "광고 화면"
        
        navigationItem.title = "광고 화면"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(didCloseButtonTapped))
        navigationController?.configureNavigationController()
    }

    @objc func didCloseButtonTapped() {
        dismiss(animated: true)
    }
}
