//
//  CityDetailViewController.swift
//  SeSAC4PopularCity
//
//  Created by Minho on 1/11/24.
//

import UIKit

class CityDetailViewController: UIViewController,
                                UITableViewDelegate,
                                UITableViewDataSource {
    
    static let identifier = "CityDetailViewController"
    var travelInfoList: [Travel] = []
    
    @IBOutlet weak var cityDetailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelInfoList = TravelInfo().travel

        navigationItem.title = "도시 상세 정보"
        navigationController?.configureNavigationController()
        configureTableView()
    }
}

// MARK: UITableViewDelegate, DataSource
extension CityDetailViewController {
    
    func configureTableView() {
        
        cityDetailTableView.delegate = self
        cityDetailTableView.dataSource = self
        
        cityDetailTableView.backgroundColor = .clear
        
        let xib = UINib(nibName: TouristSpotTableViewCell.identifier, bundle: nil)
        cityDetailTableView.register(xib, forCellReuseIdentifier: TouristSpotTableViewCell.identifier)
        
        let xib2 = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        cityDetailTableView.register(xib2, forCellReuseIdentifier: ADTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TravelInfo().travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let travelInfo = travelInfoList[index]
        
        switch travelInfo.ad {
        case true:
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            
            cell.configureCell(data: travelInfo)
            tableView.separatorStyle = .none
            
            return cell
        case false:
            let cell = tableView.dequeueReusableCell(withIdentifier: TouristSpotTableViewCell.identifier, for: indexPath) as! TouristSpotTableViewCell
            
            cell.configureCell(data: travelInfo)
            tableView.separatorStyle = .singleLine
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index = indexPath.row
        let travelInfo = travelInfoList[index]
        
        switch travelInfo.ad {
        case true:
            return 80
        case false:
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let travelInfo = travelInfoList[index]
        
        switch travelInfo.ad {
        case true:
            let sb = UIStoryboard(name: "ADView", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ADViewController.identifier) as! ADViewController
            
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
        case false:
            let sb = UIStoryboard(name: "TouristSpotView", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TouristSpotViewController.identifier) as! TouristSpotViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
