//
//  ServiceGymsViewController.swift
//  FitnessAppMidtermProject
//
//  Created by Sevar Jafarli on 19.04.24.
//

import UIKit

class ServiceGymsViewController: ItemsViewController {

    var serviceModel: GymServiceModel?
    
    var gyms: [GymModel] = [] {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = serviceModel?.serviceName
        tableView.dataSource = self
        tableView.delegate = self
        fetchGyms()
    }

    
    private func fetchGyms() {
        if let id = serviceModel?.id {
           gyms =  NetworkManager.shared.fetchGymsWithService(serviceId: id)
        }
       
    }
}


extension ServiceGymsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gyms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GymItemTableViewCell.reuseIdentifier, for: indexPath) as! GymItemTableViewCell
        let model = gyms[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}

extension ServiceGymsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        routeToItemDetail(model: gyms[indexPath.row], navigationController: navigationController)
    }
}
