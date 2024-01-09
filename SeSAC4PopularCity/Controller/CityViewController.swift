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
    var cityList: [City] = []
    var visibleCityType: CityType = .alltype
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didSegmentedControlValueChanged(segmentedControl)
        configureSegmentedControl()

        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 220)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 8, left: 32, bottom: 0, right: 32)
        layout.scrollDirection = .vertical
        
        cityCollectionView.collectionViewLayout = layout
        
        cityList = shared.city
    }
    
    func configureSegmentedControl() {
        segmentedControl.setTitle("모두", forSegmentAt: 0)
        segmentedControl.setTitle("국내", forSegmentAt: 1)
        segmentedControl.setTitle("해외", forSegmentAt: 2)
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
