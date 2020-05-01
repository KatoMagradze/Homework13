//
//  AddCarViewController.swift
//  Homework13
//
//  Created by Kato on 5/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class Car {
    
    var modelName = ""
    var modelPrice = ""
    var carImage = UIImage()
}


class AddCarViewController: UIViewController {
    
    var newCar = [Car]()
    var carImages = [UIImage]()
    var selectedImage = 0
    


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newModelTextField: UITextField!
    @IBOutlet weak var newPriceTextField: UITextField!
    
    override func loadView() {
        self.carImages.append(UIImage(named: "car1")!)
        self.carImages.append(UIImage(named: "car2")!)

        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    @IBAction func onAddTapped(_ sender: UIButton) {
        
        let addCar = Car()
        addCar.modelName = newModelTextField.text!
        addCar.modelPrice = newPriceTextField.text!
        addCar.carImage = carImages[self.selectedImage]
        
        if addCar.modelName == "" || addCar.modelPrice == "" {
            let alert1 = UIAlertController(title: "Try Again", message: "You must enter information in all fields in order to continue.", preferredStyle: .alert)
            alert1.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert1, animated: true, completion: nil)
        }
            
        else {
            
        newCar.append(addCar)
        
  
        
            if let firstViewController = self.navigationController?.viewControllers.first {
                let vc = firstViewController as! CarsListViewController
                vc.finalCar = self.newCar
                vc.tableView.reloadData()
                self.navigationController?.popToViewController(firstViewController, animated: true)
            }
        }
    }
    

}

extension AddCarViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "choose-photo-cell") as! ChooseCarPhotoCell
        
        cell.choosePhotoImageView.image = carImages[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedImage = indexPath.row
    }
}

