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
    var currentPotSize:Double!
    
    var chipValues:[Chip.chipType:Double] = [:]

    
    var currentPot:[Chip] = []
    
    var blueChipArray:[Chip] = []

    
    @IBOutlet weak var potLabel: UILabel!

    @IBAction func popOutMenu(_ sender: Any) {
        //goToNextPlayer()
        
        /*addToPot(chips: blueChipArray)
        
        var  playerNameValues = [String: Double]()
        for playerView in playerContentViews {
            playerNameValues[playerView.player!] = playerView.currentValue
        }*/
         
        
        
        giveChipsFromPot()

        

    }
    
    
    func giveChipsFromPot () {
        
        potLabel.text = ""
        
        playerContentViews[currentPlayer].addChipsFromPot(chips: currentPot)
        
        currentPot.removeAll()
        
    }

    
    @IBOutlet weak var contentScroll: UIScrollView!

    func goToNextPlayer() {
        contentScroll.isScrollEnabled = true

        currentPlayer += 1
        if currentPlayer == playerNames.count {
            currentPlayer = 0
        }
        let frame = playerContentViews[currentPlayer].frame
        contentScroll.scrollRectToVisible(frame, animated: true)
        
        contentScroll.isScrollEnabled = false

        
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
        //contentScroll.isUserInteractionEnabled = false
        
        contentScroll.isScrollEnabled = false

        
        var currentWidth:CGFloat = 0
        for name in playerNames {
            let playerContent = playerContentView(frame: CGRect(x: currentWidth, y:0 , width: self.view.frame.width, height: self.view.frame.height), name: name)
            playerContentViews.append(playerContent)
            contentScroll.addSubview(playerContent)
            currentWidth += self.view.frame.width
        }
        currentPotSize = Double(0)
        
        
        let potView = UIView(frame: CGRect(x: 56, y: 50, width: 200, height: 200))
        let dashedBorder = CAShapeLayer()
        dashedBorder.strokeColor = UIColor.black.cgColor
        dashedBorder.lineDashPattern = [5, 10]
        dashedBorder.lineWidth = 1.5
        dashedBorder.fillColor = nil
        dashedBorder.path = UIBezierPath(roundedRect: CGRect(x: 56, y: 50, width: 200, height: 150), cornerRadius: 100).cgPath
        potView.layer.addSublayer(dashedBorder)
        self.view.addSubview(potView)
        
        
        let dashedMarker = UIView(frame: CGRect(x: 0, y: 210, width: 400, height: 10))
        let dashes = CAShapeLayer()
        dashes.strokeColor = UIColor.black.cgColor
        dashes.lineDashPattern = [7, 20]
        dashes.lineWidth = 1.5
        dashes.fillColor = nil
        dashes.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 210, width: 420, height: 0), cornerRadius: 1).cgPath
        dashedMarker.layer.addSublayer(dashes)
        self.view.addSubview(dashedMarker)
        
        potLabel.text = ""
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func addToPot(chips:[Chip]) {

        for chip in chips {
            chip.removeGestureRecognizer(chip.gestureRecognizers![0])

            currentPotSize += chipValues[chip.selfchipType]!
            self.view.addSubview(chip)
            currentPot.append(chip)
            moveChipToPot(chip: chip)
        }
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        potLabel.text = "Pot $" + formatter.string(from: currentPotSize as NSNumber)!

    }
    
    func moveChipToPot(chip:Chip) {


        UIView.animate(withDuration: 0.7, animations: {
            chip.frame = CGRect(x: CGFloat(Int.random(in: Int(UIScreen.main.bounds.width/2) - 105 ..< Int(UIScreen.main.bounds.width/2) + 45 )), y: CGFloat(Int.random(in: 50 ..< 250)), width: 40, height: 40)
        }, completion: { (finished: Bool) in
            self.playerContentViews[self.currentPlayer].chipsToBid.removeAll()
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
