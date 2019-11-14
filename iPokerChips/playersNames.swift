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
    var names:[String] = []
    
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
        cell.textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)

        return cell
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let index = playerTableView.indexPath(for: textField.superview?.superview as! UITableViewCell)
        
        names[(index?.row)!] = textField.text!
    }
    
 
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playPressed(_ sender: Any) {
        
        for (index, name) in names.enumerated() {
            if name.trimmingCharacters(in: .whitespaces) == "" {
                
                names[index] = String(format: "Player %d", Int(index+1))
            }
            
            
            
            
        }
        
        
        print(names)
    }
    
    @IBOutlet weak var playerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        playerTableView.dataSource = self
        playerTableView.delegate = self
        playerTableView.rowHeight = 74.0
        
        for i in 1...numberOfPlayers! {
            names.append(String(format:"Player %d", i))
        }
        
        // Do any additional setup after loading the view.
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
