//
//  CarsListVC.swift
//  Cars&Tables
//
//  Created by Admin on 8/25/22.
//

import UIKit

class CarsListVC: UIViewController {

    var tableView = UITableView()
    var cars: [Car] = []
    let carCell = "carCell"
    
    override func viewDidLoad() {
        view.backgroundColor = .green
        title = "Top Exotic Cars"
        configureTableView()
        setTableViewDelegates()
         cars = fetchData()
        super.viewDidLoad()
    }
    
    func configureTableView() {
        //adding tableview to VC
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: carCell)
        tableView.pin(view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension CarsListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: carCell) as! CarTableViewCell
        
        let car = cars[indexPath.row]
        cell.set(car)
        
        return cell
    }
}

extension CarsListVC {
    
    func fetchData() -> [Car] {
        let cars = [ Car(image: Images.astonMartin, title: "2019Aston Martin DBS Superleggera"),
                     Car(image: Images.audi, title: "Audi"),
                     Car(image: Images.bently, title: "Bently"),
                     Car(image: Images.ferrari, title: "Ferrari"),
                     Car(image: Images.bugatti, title: "Bugatti"),
                     Car(image: Images.lambo, title: "Lambo"),
                     Car(image: Images.mercedes, title: "Mercedes"),
                     Car(image: Images.polestar, title: "Volvo Polestar"),
                     Car(image: Images.porsche, title: "Porsche Taycan"),
                     Car(image: Images.tesla, title: "Tesla Roadster")
        
        ]
        
        return cars
    }
}
