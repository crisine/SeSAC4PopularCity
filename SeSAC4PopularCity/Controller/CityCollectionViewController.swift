//
//  CityCollectionViewController.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/9/24.
//

import UIKit

class CityCollectionViewController: UICollectionViewController {

    var cityList = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.setupLayout()
        
        collectionView.collectionViewLayout = layout
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        cell.configureCell(data: cityList[indexPath.row])
        
        return cell
    }
}
