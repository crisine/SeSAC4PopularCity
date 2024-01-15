//
//  CityViewController.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/9/24.
//

import UIKit

class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, ViewPresentableProtocol {
    
    @IBOutlet weak var citySearchBar: UISearchBar!
    
    var navigationTitleString: String {
        get {
            return "SeSAC TRAVEL"
        }
    }
    var backGroundColor: UIColor {
        get {
            return .white
        }
    }
    
    static var identifier: String = "CityViewController"
    
    let citySegmentTitles = ["모두", "국내", "해외"]
    var cityList: [City] = CityInfo.city {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    var visibleCityType: CityType = .alltype
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        didSegmentedControlValueChanged(segmentedControl)
        segmentedControl.setupSegmentedControl(titles: citySegmentTitles)

        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.setupLayout()
        
        cityCollectionView.collectionViewLayout = layout
        
        cityList = CityInfo.city
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
            cityList = CityInfo.city
        case .domestic:
            cityList = CityInfo.city.filter { $0.domestic_travel == true }
        case .foreign:
            cityList = CityInfo.city.filter { $0.domestic_travel == false }
        default:
            print("에러: SegmentedControlIndexOutOfBounds")
        }
        
        cityCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "CityDetailView", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: CityDetailViewController.identifier) as! CityDetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CityViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var filteredData: [City] = []
        
        if searchBar.text == "" {
            cityList = CityInfo.city
        } else {
            let searchText = searchBar.text!.lowercased()
            
            filteredData = cityList.filter { $0.city_name.lowercased().contains(searchText) ||
                $0.city_english_name.lowercased().contains(searchText) ||
                $0.city_explain.lowercased().contains(searchText)}
            
            cityList = filteredData
        }
        
        // 프로퍼티 옵저버로 갱신
    }
}
