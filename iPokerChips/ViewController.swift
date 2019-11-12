//
//  ViewController.swift
//  iPokerChips
//
//  Created by Nicholas Deily on 11/11/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData = ["2", "3","4","5","6","7","8","9", "10"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    

    

    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addPlayer(_ sender: Any) {
    }
    
    
    @IBAction func playPressed(_ sender: Any) {
    }
    @IBOutlet weak var playerDropdown: UIPickerView!
    @IBOutlet weak var selectPlayers: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
//setting the Play button's corners round
        playButton.layer.cornerRadius = 10
        playButton.clipsToBounds = true
    
        
//Set the delegate and data source to self
        self.playerDropdown.delegate = self
        self.playerDropdown.dataSource = self
    }


}

