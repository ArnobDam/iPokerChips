//
//  GameViewController.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/20/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var handSize: Double?
    var playerNames: [String] = []
    var playerContentViews: [playerContentView] = []
    
    @IBOutlet weak var contentScroll: UIScrollView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        contentScroll.contentSize = CGSize(width: contentScroll.frame.size.width*CGFloat(playerNames.count), height: contentScroll.frame.size.height)
        contentScroll.contentSize.height = 1
        
        var currentWidth:CGFloat = 0
        for name in playerNames {
            /*var playerContent = playerContentView(frame: CGRect(x: 0, y: currentWidth, width: self.view.frame.width, height: self.view.frame.height), playerName: name)
            playerContentViews.append(playerContent)
            contentScroll.addSubview(playerContent)
            currentWidth += self.view.frame.width*/
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
