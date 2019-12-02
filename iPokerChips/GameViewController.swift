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
    var currentBid: Double!
    var chipValues:[Chip.chipType:Double] = [:]
    
    var startingPlayer:Int = -1


    
    var currentPot:[Chip] = []
    
    var blueChipArray:[Chip] = []
    
    let formatter = NumberFormatter()

    
    @IBOutlet weak var potLabel: UILabel!


    @IBAction func popOutMenu(_ sender: Any) {
        //goToNextPlayer()
        
        /*addToPot(chips: blueChipArray)
        
        var  playerNameValues = [String: Double]()
        for playerView in playerContentViews {
            playerNameValues[playerView.player!] = playerView.currentValue
        }*/
         
        
        
      //  giveChipsFromPot()

        
        let popupView = PopUpViewController()
        popupView.choices = playerNames
        self.navigationController?.pushViewController(popupView, animated: true)


    }
    
    func nextRound()  {
        
        for player in 0...playerNames.count - 1 {
            playerContentViews[player].folded = false
        }
        
        
        
        startingPlayer += 1
        
        
        if startingPlayer == playerNames.count {
            startingPlayer = 0
        }
        
        
        
        
        contentScroll.isScrollEnabled = true
        
        currentPlayer = startingPlayer

        
        let frame = playerContentViews[startingPlayer].frame
        contentScroll.scrollRectToVisible(frame, animated: true)
        
        contentScroll.isScrollEnabled = false
        
    }
    
    
    func giveChipsFromPot (to:Int) {
        
        potLabel.text = ""
        playerContentViews[to].addChipsFromPot(chips: currentPot)
        currentPot.removeAll()
        currentPotSize = 0
        
        
        potLabel.text = "Pot $" + formatter.string(from: currentPotSize as NSNumber)!
        nextRound()
        
    }

    
    @IBOutlet weak var contentScroll: UIScrollView!
    


    func goToNextPlayer() {
        contentScroll.isScrollEnabled = true

        var foldedPlayers = 0
        
        currentPlayer += 1
        if currentPlayer == playerNames.count {
            currentPlayer = 0
        }
        
        while playerContentViews[currentPlayer].folded || (playerContentViews[currentPlayer].currentHandSize == 0) {
            foldedPlayers += 1
            
            if foldedPlayers == playerNames.count{
                print("all folded")
                let popupView = PopUpViewController()
                popupView.choices = playerNames
                self.navigationController?.pushViewController(popupView, animated: true)
                break
                
                
            }

            if currentPlayer == playerNames.count-1 {
                currentPlayer = 0
            }
            else {
            currentPlayer += 1
            }
        }

        
        let frame = playerContentViews[currentPlayer].frame
        contentScroll.scrollRectToVisible(frame, animated: true)
        
        contentScroll.isScrollEnabled = false

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "green background")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        contentScroll.contentSize = CGSize(width: contentScroll.frame.size.width*CGFloat(playerNames.count), height: contentScroll.frame.size.height)
        contentScroll.contentSize.height = 1
        //contentScroll.isUserInteractionEnabled = false
        
        contentScroll.isScrollEnabled = false

        print("the handsize is \(handSize)")
        
        var currentWidth:CGFloat = 0
        for name in playerNames {
            let playerContent = playerContentView(frame: CGRect(x: currentWidth, y:0 , width: self.view.frame.width, height: self.view.frame.height), name: name, startingHandsize:handSize!, loadedChipVals: chipValues)

            playerContentViews.append(playerContent)
            contentScroll.addSubview(playerContent)
            currentWidth += self.view.frame.width
        }
        currentPotSize = Double(0)
        currentBid = Double (0)
        
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        potLabel.text = "Pot $" + formatter.string(from: currentPotSize as NSNumber)!
        
        
        let potView = UIView(frame: CGRect(x: 56, y: 50, width: 200, height: 200))
        let dashedBorder = CAShapeLayer()
        dashedBorder.strokeColor = UIColor.black.cgColor
        dashedBorder.lineDashPattern = [5, 10]
        dashedBorder.lineWidth = 1.5
        dashedBorder.fillColor = nil
        dashedBorder.path = UIBezierPath(roundedRect: CGRect(x: 56, y: 50, width: 200, height: 150), cornerRadius: 100).cgPath
        potView.layer.addSublayer(dashedBorder)
        self.view.addSubview(potView)
        
        
        let dashedMarker = UIView(frame: CGRect(x: 0, y: 280, width: 400, height: 10))
        let dashes = CAShapeLayer()
        dashes.strokeColor = UIColor.black.cgColor
        dashes.lineDashPattern = [7, 20]
        dashes.lineWidth = 1.5
        dashes.fillColor = nil
        dashes.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 280, width: 420, height: 0), cornerRadius: 1).cgPath
        dashedMarker.layer.addSublayer(dashes)
        self.view.addSubview(dashedMarker)
        
        
        let dashes2 = CAShapeLayer()
        dashes2.strokeColor = UIColor.black.cgColor
        dashes2.lineDashPattern = [7, 20]
        dashes2.lineWidth = 2
        dashes2.fillColor = nil
        dashes2.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 280, width: 420, height: 0), cornerRadius: 1).cgPath
        
        var newView = UIView(frame: CGRect(x: 0, y: 360, width: 100, height: 100))
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 207, y: 200), radius:100, startAngle: .pi, endAngle: 0, clockwise: true)
        let circleShape = CAShapeLayer()
        circleShape.path = circlePath.cgPath
        dashes2.path = circlePath.cgPath
        newView.layer.addSublayer(dashes2)
        self.view.addSubview(newView)
        
        
        
        self.view.bringSubviewToFront(potLabel)
        nextRound()
        // Do any additional setup after loading the view.
    }
    
    
//    func setCurrentBid(chips:[Chip]) {
//
//        for chip in chips {
//
//            print(currentBid)
//        }
//
//
//    }
    
    func addToPot(chips:[Chip]) {

        for chip in chips {
            
            /*if chip.gestureRecognizers?.count != 0{
                chip.removeGestureRecognizer((chip.gestureRecognizers?[0])!)
            }
            */
            
            if let recognizers = chip.gestureRecognizers {
                for recognizer in recognizers   {
                    chip.removeGestureRecognizer(recognizer)
                }
            }
 

            currentPotSize += chipValues[chip.selfchipType]!
            self.view.addSubview(chip)
            currentPot.append(chip)
            moveChipToPot(chip: chip)


        }

        
        potLabel.text = "Pot $" + formatter.string(from: currentPotSize as NSNumber)!

    }
    
    func moveChipToPot(chip:Chip) {


        UIView.animate(withDuration: 0.7, animations: {
            chip.frame = CGRect(x: CGFloat(Int.random(in: Int(UIScreen.main.bounds.width/2) - 95 ..< Int(UIScreen.main.bounds.width/2) + 60 )), y: CGFloat(Int.random(in: 100 ..< 215)), width: 40, height: 40)
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
