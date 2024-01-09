//
//  CityTableViewController.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/9/24.
//

import UIKit

class CityTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var cityList = CityInfo().city
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        
        cell.configureCell(data: cityList[indexPath.row])
        
        return cell
    }
    
    @IBOutlet weak var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        cityCollectionView.delegate = self
        cityCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160, height: 220)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        layout.scrollDirection = .vertical
        
        cityCollectionView.collectionViewLayout = layout
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
