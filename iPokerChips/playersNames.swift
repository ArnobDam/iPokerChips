//
//  playersNames.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/11/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class playersNames: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    var numberOfPlayers: Int?
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfPlayers!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "textFieldCell") as! textFieldTableViewCell
        var frameRect = cell.textField.frame
        frameRect.size.height = 60 // <-- Specify the height you want here.
        cell.textField.frame = frameRect
        cell.textField.placeholder = String(format: "Player %d", Int(indexPath.row+1))
        cell.textField.font = UIFont(descriptor: .init(), size: 21)
        cell.textField.delegate = self
        cell.backgroundColor = UIColor.clear


        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if numberOfPlayers! < 3 {
            return false
        }
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (numberOfPlayers! > 2) {
            if editingStyle == .delete {
                //self.names.remove(at: indexPath.row)
                numberOfPlayers = numberOfPlayers! - 1
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                
                if indexPath.row < numberOfPlayers! - 1 {
                    for index in indexPath.row...numberOfPlayers! - 1 {
                        print(index)
                        let cell =  tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! textFieldTableViewCell
                        cell.textField.placeholder = String(format: "Player %d", Int(index+1))
                    }
                }
                else {
                    let cell =  tableView.cellForRow(at: IndexPath(row: numberOfPlayers!-1, section: 0)) as! textFieldTableViewCell
                    cell.textField.placeholder = String(format: "Player %d", numberOfPlayers!)
                }
            }
        }

    }
    
    

    
 
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playPressed(_ sender: Any) {
        

        var names:[String] = []
        for x in 0...numberOfPlayers!-1{
            let cell =  playerTableView.cellForRow(at: IndexPath(row: x, section: 0)) as! textFieldTableViewCell
            if cell.textField.text == "" {
                names.append(cell.textField.placeholder!)
            }
            else {
                names.append(cell.textField.text!)
            }
            
            
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let chipValueView =  storyboard.instantiateViewController(withIdentifier: "chipValueController") as! ChipValueView
        
        chipValueView.playerNames = names
        
        self.navigationController?.pushViewController(chipValueView, animated: true)
        
        
        print(names)
    }
    
    @IBOutlet weak var playerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "background2")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        self.navigationController?.navigationBar.isHidden = false
        playerTableView.dataSource = self
        playerTableView.delegate = self
        playerTableView.rowHeight = 74.0
        
        playButton.layer.cornerRadius = 10
        playButton.clipsToBounds = true
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 1
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
        
    }
}
