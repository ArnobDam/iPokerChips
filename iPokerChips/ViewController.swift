//
//  ViewController.swift
//  iPokerChips
//
//  Created by Nicholas Deily on 11/11/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func addPlayer(_ sender: Any) {
    }
    
    
    @IBAction func playPressed(_ sender: Any) {
    }
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        
        playButton.layer.cornerRadius = 10
        playButton.clipsToBounds = true
        // Do any additional setup after loading the view.
    }


}

