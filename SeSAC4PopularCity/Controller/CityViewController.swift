//
//  CityViewController.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/9/24.
//

import UIKit

class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    let shared = CityInfo()
    let citySegmentTitles = ["모두", "국내", "해외"]
    var cityList: [City] = []
    var visibleCityType: CityType = .alltype
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didSegmentedControlValueChanged(segmentedControl)
        segmentedControl.setupSegmentedControl(titles: citySegmentTitles)

        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.setupLayout()
        
        cityCollectionView.collectionViewLayout = layout
        
        cityList = shared.city
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        cell.configureCell(data: cityList[indexPath.row])
        
        return cell
    }
    
    @IBAction func didSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        let selectedIndex = sender.selectedSegmentIndex
        
        for i in 0..<sender.numberOfSegments {
            if i == sender.selectedSegmentIndex {
                sender.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)], for: .selected)
            }
        }
        
        let selectedCityType = CityType(rawValue: selectedIndex)
        
        switch selectedCityType {
        case .alltype:
            cityList = shared.city
        case .domestic:
            cityList = shared.city.filter { $0.domestic_travel == true }
        case .foreign:
            cityList = shared.city.filter { $0.domestic_travel == false }
        default:
            print("에러: SegmentedControlIndexOutOfBounds")
        }
        
        cityCollectionView.reloadData()
    }
}
