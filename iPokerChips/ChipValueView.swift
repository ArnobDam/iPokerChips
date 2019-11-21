//
//  ChipValueView.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/18/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class ChipValueView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var playerNames:[String] = []
    var pickerData = ["$10", "$50","$100","$500","$1000"]
    
    var handSize:Double!

    @IBOutlet weak var blindText: UILabel!

    
    @IBOutlet weak var valuePicker: UIPickerView!
    @IBOutlet weak var blueChipValueLabel: UILabel!
    @IBOutlet weak var redChipValueLabel: UILabel!
    @IBOutlet weak var greenChipValueLabel: UILabel!
    @IBOutlet weak var blackChipValueLabel: UILabel!

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pickerDataString = pickerData[row]
        let range = pickerDataString.index(pickerData[row].startIndex, offsetBy: 1)..<pickerDataString.endIndex
        let valueString = pickerDataString[range]
        updateChipValues(value: Double(valueString)!)
    }
    
    func updateChipValues (value:Double) {
        
        handSize = value
        let blueValue = 0.005*value
        let redValue = 0.01*value
        let greenValue = 0.05*value
        let blackValue = 0.1*value
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        blueChipValueLabel.text = "$" + formatter.string(from: blueValue as NSNumber)!
        redChipValueLabel.text = "$" + formatter.string(from: redValue as NSNumber)!
        greenChipValueLabel.text = "$" + formatter.string(from: greenValue as NSNumber)!
        blackChipValueLabel.text = "$" + formatter.string(from: blackValue as NSNumber)!


        print(value)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(playerNames)
        valuePicker.delegate = self
        valuePicker.dataSource = self
        updateChipValues(value: 10)
    

        
        playButton.layer.cornerRadius = 10
        playButton.clipsToBounds = true
        playButton.layer.borderColor = UIColor.black.cgColor
        playButton.layer.borderWidth = 1
        // Do any additional setup after loading the view.
        
        
        blindText.text = String(format: "%@ will start as the big blind, and %@ will start as the small blind!",playerNames[playerNames.count-1], playerNames[playerNames.count - 2])
    }
    
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playPressed(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let gameViewController =  storyboard.instantiateViewController(withIdentifier: "gameViewController") as! GameViewController
        
        gameViewController.playerNames = playerNames
        gameViewController.handSize = handSize
        
        self.navigationController?.pushViewController(gameViewController, animated: true)
            
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
