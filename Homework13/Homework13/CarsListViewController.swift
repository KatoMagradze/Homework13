//
//  CarsListViewController.swift
//  Homework13
//
//  Created by Kato on 5/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class CarsListViewController: UIViewController {
    
    var finalCar : [Car] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    


    @IBAction func addBarButtonTapped(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "add_car_vc", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddCarViewController
        vc.newCar = self.finalCar
    }
    
    @IBAction func scrollUpTapped(_ sender: UIButton) {
        
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    
    @IBAction func scrollDownTapped(_ sender: UIButton) {
        let indexPath = IndexPath(row: finalCar.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    
}



extension CarsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cars-list-cell", for: indexPath) as! CarsListTableViewCell
 
        cell.modelNameLabel.text = "Model: \(finalCar[indexPath.row].modelName)"
        cell.modelPriceLabel.text = "Price: $ \(finalCar[indexPath.row].modelPrice)"
        cell.modelImageView.image = finalCar[indexPath.row].carImage
        
        return cell
    }
    
    
}
