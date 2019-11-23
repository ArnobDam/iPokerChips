//
//  ViewController.swift
//  iPokerChips
//
//  Created by Nicholas Deily on 11/11/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData = ["2", "3","4","5","6","7","8"]
    
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
        
        
//        When continue is pressed, we create a view that sets the number of players
        //let playerNamesview = playersNames()

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let playerNamesview =  storyboard.instantiateViewController(withIdentifier: "playerNamesViewController") as! playersNames
        
        playerNamesview.numberOfPlayers = Int (pickerData[playerDropdown.selectedRow(inComponent: 0)])
        
        
        print("the number of players is", playerNamesview.numberOfPlayers!)
        self.navigationController?.pushViewController(playerNamesview, animated: true)
    }
    
    @IBOutlet weak var playerDropdown: UIPickerView!
    @IBOutlet weak var selectPlayers: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        //        hide the navigation bar on menu screen
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"green background")!)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "green background")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
//setting the Play button's corners round
        playButton.layer.cornerRadius = 10
        playButton.clipsToBounds = true
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 1
    
        
//Set the delegate and data source to self
        self.playerDropdown.delegate = self
        self.playerDropdown.dataSource = self
    }


}

