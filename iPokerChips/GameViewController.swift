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
    var currentPlayer = 0
    
    var currentPot:[Chip] = []
    
    var blueChipArray:[Chip] = []

    
    
    @IBAction func popOutMenu(_ sender: Any) {
            //goToNextPlayer()
        
        addToPot(chips: blueChipArray)
        
        var  playerNameValues = [String: Double]()
        for playerView in playerContentViews {
            playerNameValues[playerView.player!] = playerView.currentValue
        }
        

    }

    
    @IBOutlet weak var contentScroll: UIScrollView!

    func goToNextPlayer() {
        currentPlayer += 1
        if currentPlayer == playerNames.count {
            currentPlayer = 0
        }
        let frame = playerContentViews[currentPlayer].frame
        contentScroll.scrollRectToVisible(frame, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "green background")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        self.navigationController?.navigationBar.isHidden = true
        
        contentScroll.contentSize = CGSize(width: contentScroll.frame.size.width*CGFloat(playerNames.count), height: contentScroll.frame.size.height)
        contentScroll.contentSize.height = 1
        contentScroll.isUserInteractionEnabled = false

        
        var currentWidth:CGFloat = 0
        for name in playerNames {
            let playerContent = playerContentView(frame: CGRect(x: currentWidth, y:0 , width: self.view.frame.width, height: self.view.frame.height), name: name)
            playerContentViews.append(playerContent)
            contentScroll.addSubview(playerContent)
            currentWidth += self.view.frame.width
        }
        
        
        let chipWidth = 75
        let chipHeight = 75
        
        let blueChip = Chip(frame: CGRect(x: 10, y: 360, width: chipWidth, height: chipHeight), chipType: .blue)
        self.view.addSubview(blueChip)
        let blueChip2 = Chip(frame: CGRect(x: 10, y: 340, width: chipWidth, height: chipHeight), chipType: .blue)
        self.view.addSubview(blueChip2)
        let blueChip3 = Chip(frame: CGRect(x: 10, y: 320, width: chipWidth, height: chipHeight), chipType: .blue)
        self.view.addSubview(blueChip3)
        let blueChip4 = Chip(frame: CGRect(x: 10, y: 300, width: chipWidth, height: chipHeight), chipType: .blue)
        self.view.addSubview(blueChip4)
        
        blueChipArray.append(blueChip)
        blueChipArray.append(blueChip2)
        blueChipArray.append(blueChip3)
        blueChipArray.append(blueChip4)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func addToPot(chips:[Chip]) {
        for chip in chips {
            self.view.addSubview(chip)
            currentPot.append(chip)
            moveChipToPot(chip: chip)
        }
        
    }
    
    func moveChipToPot(chip:Chip) {

        UIView.animate(withDuration: 0.7, animations: {
            chip.frame = CGRect(x: CGFloat(Int.random(in: Int(UIScreen.main.bounds.width/2) - 80 ..< Int(UIScreen.main.bounds.width/2) + 20 )), y: CGFloat(Int.random(in: 150 ..< 250)), width: chip.frame.width, height: chip.frame.width)
        })
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
