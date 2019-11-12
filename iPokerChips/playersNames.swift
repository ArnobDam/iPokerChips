//
//  playersNames.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/11/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class playersNames: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var numberOfPlayers: Int?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfPlayers!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "textFieldCell") as! textFieldTableViewCell
        return cell
    }
    
    
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var playerTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

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
