//
//  ViewController.swift
//  FirstTestProject
//
//  Created by Alekandr on 16.01.19.
//  Copyright © 2019 RevaAlekandrUA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var informationTest: UILabel!
    @IBOutlet weak var firstNumber: UILabel!
    @IBOutlet weak var secondNumber: UILabel!
    @IBOutlet weak var testLable: UILabel!
    
    @IBOutlet weak var result: UITextField!
    var starElement = ["starWB", "starWB", "starWB", "starWB", "starWB"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    
        firstNumber.text = String(arc4random_uniform(10))
        secondNumber.text = String(arc4random_uniform(10))
        informationTest.text = "набери пять звездочек"
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return starElement.count
        //print(starElement)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let imageCel = UIImage.init(named: starElement[indexPath.row])
        cell.image.image = imageCel
        return cell
    }
    

    @IBAction func checkButt(_ sender: UIButton) {
        let firstNum = Int(firstNumber.text!)
        let secondNum = Int(secondNumber.text!)
        let sum: Int = firstNum! + secondNum!
        
        if Int(result.text!) == sum {
            starElement.insert("goldstar", at: 0) 
            firstNumber.text = String(arc4random_uniform(10))
            secondNumber.text = String(arc4random_uniform(10))
            result.text = ""
        }else {
            testLable.text = "not write"
        }
        collectionView.reloadData()
        
    }
    

   


}

