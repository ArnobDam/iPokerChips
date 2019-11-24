//
//  playerContentView.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/20/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//
import UIKit


extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}


class playerContentView: UIView {
    var redChipArray: [Chip] = []
    var blueChipArray: [Chip] = []
    var blackChipArray: [Chip] = []
    var greenChipArray: [Chip] = []
    
    var chipsToBid:[Chip] = []
    
    var currentValue: Double = 0
    
    var shouldHighlight = false

    
    var player: String?
    
    
    var highlightedView:UIView!
    
    var draggapleChipBlue: Chip!
    var draggapleChipBlack: Chip!
    var draggableChipRed: Chip!
    var draggableChipGreen: Chip!
    
    let chipWidth: CGFloat = 75
    let chipHeight: CGFloat = 75
    
    var newCoord: CGPoint = CGPoint(x:0, y:0)
    var firstCoord: CGPoint = CGPoint(x: 0, y: 0)
    
     init(frame: CGRect, name: String) {
        super.init(frame: frame)
        player = name
        displayView()
       // addRecognizerToChip()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func handlePan(recognizer: UIPanGestureRecognizer) {
        if (recognizer.view == nil) {
            return
        }

        self.newCoord = recognizer.location(in: self)
        let x = self.newCoord.x - (recognizer.view?.frame.width ?? 0) / 2
        let y = self.newCoord.y - (recognizer.view?.frame.height ?? 0) / 2
        recognizer.view!.frame = CGRect(x: x, y: y, width: draggapleChipBlack.frame.width, height: draggapleChipBlack.frame.height)
        
        if (recognizer.state == UIGestureRecognizer.State.began) {
            highlightView()
            shouldHighlight = true
            
        }
        
        else if (recognizer.state == UIGestureRecognizer.State.ended) {
            shouldHighlight = false
            if (y < (self.frame.height / 2)) {
                moveChipToPot(chip: recognizer.view as! Chip)
                removeChipFromStack(chip:recognizer.view as! Chip)
                chipsToBid.append(recognizer.view as! Chip)
                showBidButtons()
                
                
                //blackChipArray.removeLast()
                
                
                
               /* if (blackChipArray.count > 0) {
                    draggapleChipBlack = blackChipArray[blackChipArray.count-1]
                    addRecognizerToChip()
                }*/
               
            }
            else {
                addChipToStack(chip: recognizer.view as! Chip)
                
            }
        }
        
        
        self.bringSubviewToFront(recognizer.view!)

    }
    /*
    func addRecognizerToChip() {
        let blackGesture = UILongPressGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        blackGesture.minimumPressDuration = 0.0
        
        let blueGesture = UILongPressGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        blueGesture.minimumPressDuration = 0.0
        
        let redGesture = UILongPressGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        redGesture.minimumPressDuration = 0.0
        
        let greenGesture = UILongPressGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        greenGesture.minimumPressDuration = 0.0
        
        draggapleChipBlue.addGestureRecognizer(blueGesture)
        draggableChipRed.addGestureRecognizer(redGesture)
        draggapleChipBlack.addGestureRecognizer(blackGesture)
        draggableChipGreen.addGestureRecognizer(greenGesture)
        
        draggapleChipBlack.isUserInteractionEnabled = true
        draggapleChipBlue.isUserInteractionEnabled = true
        draggableChipGreen.isUserInteractionEnabled = true
        draggableChipRed.isUserInteractionEnabled = true
        self.isUserInteractionEnabled = true
    }
    */
    
    
    func addChipToStack (chip:Chip) {
        if chip.selfchipType == Chip.chipType.blue{
            
            
            if !blueChipArray.contains(chip) {
                blueChipArray.append(chip)
                
                if blueChipArray.count > 1 {
                    let previousChip = blueChipArray[blueChipArray.count - 2]
                    if !previousChip.gestureRecognizers!.isEmpty {
                        previousChip.removeGestureRecognizer(previousChip.gestureRecognizers![0])
                    }
                }
            }
        
            let frame = CGRect(x: 10, y: 760-CGFloat(20*(blueChipArray.count-1)), width: chipWidth, height: chipHeight)
            moveChipTo(chip: chip, frame: frame)

            }
        
        
        
        if chip.selfchipType == Chip.chipType.red{
            
            if !redChipArray.contains(chip) {
                redChipArray.append(chip)
                
                if redChipArray.count > 1 {
                    let previousChip = redChipArray[redChipArray.count - 2]
                    if !previousChip.gestureRecognizers!.isEmpty {
                        previousChip.removeGestureRecognizer(previousChip.gestureRecognizers![0])
                    }
                }
            }
            let frame = CGRect(x: 120, y: 760-CGFloat(20*(redChipArray.count-1)), width: chipWidth, height: chipHeight)
            moveChipTo(chip: chip, frame: frame)
            

        }
        
        
        if chip.selfchipType == Chip.chipType.black{
            
            if !blackChipArray.contains(chip) {
                blackChipArray.append(chip)
                if blackChipArray.count > 1 {
                    let previousChip = blackChipArray[blackChipArray.count - 2]
                    if !previousChip.gestureRecognizers!.isEmpty {
                        previousChip.removeGestureRecognizer(previousChip.gestureRecognizers![0])
                    }
                }
            }
            let frame = CGRect(x: 320, y: 760-CGFloat(20*(blackChipArray.count-1)), width: chipWidth, height: chipHeight)
            moveChipTo(chip: chip, frame: frame)

        }
        
        
        if chip.selfchipType == Chip.chipType.green{
            
            if !greenChipArray.contains(chip) {
                greenChipArray.append(chip)
                
                if greenChipArray.count > 1 {
                    let previousChip = greenChipArray[greenChipArray.count - 2]
                    if !previousChip.gestureRecognizers!.isEmpty {
                        previousChip.removeGestureRecognizer(previousChip.gestureRecognizers![0])
                    }
                }
            }
            
            let frame = CGRect(x: 220, y: 760-CGFloat(20*(greenChipArray.count-1)), width: chipWidth, height: chipHeight)
            moveChipTo(chip: chip, frame: frame)
            
        }
        
        
        
    }
    
    func moveChipTo (chip:Chip, frame: CGRect) {
        
        UIView.animate(withDuration: 0.7, animations: {
            chip.frame = frame
        })
        
    }
    
    
    func addGestureRecognizerToChip(chip:Chip) {
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        gestureRecognizer.minimumPressDuration = 0.0
        chip.addGestureRecognizer(gestureRecognizer)
        chip.isUserInteractionEnabled = true
    }
    
    
    func removeChipFromStack (chip:Chip){
        if chip.selfchipType == Chip.chipType.blue{
            if let index = blueChipArray.firstIndex(of: chip) {
                print(index)
                blueChipArray.remove(at: index)
                if blueChipArray.count > 0 {
                    addGestureRecognizerToChip(chip: blueChipArray[blueChipArray.count - 1])
                }
            }
        }
        
        
        
        if chip.selfchipType == Chip.chipType.red{
            if let index = redChipArray.firstIndex(of: chip) {
                print(index)
                redChipArray.remove(at: index)
                if redChipArray.count > 0 {
                    addGestureRecognizerToChip(chip: redChipArray[redChipArray.count - 1])
                }
            }
        }
        
        
        if chip.selfchipType == Chip.chipType.black{
            if let index = blackChipArray.firstIndex(of: chip) {
                print(index)
                blackChipArray.remove(at: index)
                if blackChipArray.count > 0 {
                    addGestureRecognizerToChip(chip: blackChipArray[blackChipArray.count - 1])
                }
            }
        }
        
        
        
        if chip.selfchipType == Chip.chipType.green{
            if let index = greenChipArray.firstIndex(of: chip) {
                print(index)
                greenChipArray.remove(at: index)
                if greenChipArray.count > 0 {
                    addGestureRecognizerToChip(chip: greenChipArray[greenChipArray.count - 1])
                }
            }
        }
        
    }

    
    func moveChipToPot(chip:Chip) {
        
        UIView.animate(withDuration: 0.7, animations: {
            chip.frame = CGRect(x: CGFloat(Int.random(in: Int(UIScreen.main.bounds.width/2) - 80 ..< Int(UIScreen.main.bounds.width/2) + 20 )), y: CGFloat(Int.random(in: 250 ..< 350)), width: 40, height: 40)
        })
    }
    
    func addChipsFromPot(chips:[Chip]) {
        
        for chip in chips{
            self.addSubview(chip)
            addChipToStack(chip: chip)
        }
        
    }
    
    var raiseButton:UIButton!
    var callButton:UIButton!
    var foldButton:UIButton!
    var cancelButton:UIButton!
    
    
    
    func displayView(){
        callButton =   UIButton(frame: CGRect(x:240, y: 510, width: 150, height: 50))
        
        callButton.setTitle("Call/Check", for: .normal)
        callButton.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        callButton.addTarget(self, action: #selector(callButtonPressed), for: .touchUpInside)
        callButton.layer.cornerRadius = 5
        callButton.layer.borderWidth = 1
        callButton.layer.borderColor = UIColor.white.cgColor
        callButton.backgroundColor = UIColor.blue
        callButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(callButton)
        
        foldButton = UIButton(frame: CGRect(x: 30, y: 510, width: 150, height: 50))
        foldButton.setTitle("Fold", for: .normal)
        foldButton.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        foldButton.addTarget(self, action: #selector(foldButtonPressed), for: .touchUpInside)
        foldButton.layer.cornerRadius = 5
        foldButton.layer.borderWidth = 1
        foldButton.layer.borderColor = UIColor.white.cgColor
        foldButton.setTitleColor(.white, for: .normal)
        foldButton.backgroundColor  = UIColor.black
        foldButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(foldButton)
        
        raiseButton = UIButton(frame: CGRect(x: 240, y: 430, width: 150, height: 50))
        
        raiseButton.setTitle("Raise", for: .normal)
        raiseButton.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        raiseButton.addTarget(self, action: #selector(raiseButtonPressed), for: .touchUpInside)
        raiseButton.layer.cornerRadius = 5
        raiseButton.layer.borderWidth = 1
        raiseButton.layer.borderColor = UIColor.white.cgColor
        raiseButton.setTitleColor(.white, for: .normal)
        raiseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        raiseButton.backgroundColor  = UIColor.orange
        self.addSubview(raiseButton)
        raiseButton.isHidden = true
        
        cancelButton = UIButton(frame: CGRect(x: 30, y: 430, width: 150, height: 50))
        
        cancelButton.setTitle("Reset", for: .normal)
        cancelButton.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        cancelButton.layer.cornerRadius = 5
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = UIColor.white.cgColor
        //cancel.titleLabel?.textColor = UIColor.red
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.backgroundColor  = UIColor.init(displayP3Red: 255, green: 0, blue: 0, alpha: 0.5)
        cancelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(cancelButton)
        cancelButton.isHidden = true
        
//        let bid = UIButton(frame: CGRect(x: 300, y: 100, width: 100, height: 50))
//
//        bid.setTitle("bid", for: .normal)
//        bid.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
//        bid.addTarget(self, action: #selector(bidPressed), for: .touchUpInside)
//        bid.layer.cornerRadius = 5
//        bid.layer.borderWidth = 1
//        bid.layer.borderColor = UIColor.black.cgColor
//        self.addSubview(bid)
        
        
//        creating labels
        
        let playerTitle = UILabel(frame: CGRect(x: 136, y: -49, width: 150, height: 150
        ))
        playerTitle.text = player
        playerTitle.font = UIFont (name: "Gurmukhi MN", size: 30)
        playerTitle.textColor = UIColor.white
        playerTitle.textAlignment = .center
        self.addSubview(playerTitle)
        
        let dragToRaise = UILabel(frame: CGRect(x: 130, y: 350, width: 200, height: 100))
        dragToRaise.text = "Drag chip to raise!"
        dragToRaise.font = UIFont(name: "Gurmukhi MN", size: 20)
        dragToRaise.textColor = UIColor.white
        dragToRaise.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(dragToRaise)
        

        
        
        let blueChip = Chip(frame: CGRect(x: 10, y: 760, width: chipWidth, height: chipHeight), chipType: .blue)
        self.addSubview(blueChip)
        let blueChip2 = Chip(frame: CGRect(x: 10, y: 740, width: chipWidth, height: chipHeight), chipType: .blue)
        self.addSubview(blueChip2)
        let blueChip3 = Chip(frame: CGRect(x: 10, y: 720, width: chipWidth, height: chipHeight), chipType: .blue)
        self.addSubview(blueChip3)
        let blueChip4 = Chip(frame: CGRect(x: 10, y: 700, width: chipWidth, height: chipHeight), chipType: .blue)
        self.addSubview(blueChip4)
        
        draggapleChipBlue = blueChip4
        
        
        blueChipArray.append(blueChip)
        blueChipArray.append(blueChip2)
        blueChipArray.append(blueChip3)
        blueChipArray.append(blueChip4)
        
        
        let redChip = Chip(frame: CGRect(x: 120, y: 760, width: chipWidth, height: chipHeight), chipType: .red)
        self.addSubview(redChip)
        let redChip2 = Chip(frame: CGRect(x: 120, y: 740, width: chipWidth, height: chipHeight), chipType: .red)
        self.addSubview(redChip2)
        
        let redChip3 = Chip(frame: CGRect(x: 120, y: 720, width: chipWidth, height: chipHeight), chipType: .red)
        self.addSubview(redChip3)
        
        let redChip4 = Chip(frame: CGRect(x: 120, y: 700, width: chipWidth, height: chipHeight), chipType: .red)
        self.addSubview(redChip4)
        
        draggableChipRed = redChip4
        
        redChipArray.append(redChip)
        redChipArray.append(redChip2)
        redChipArray.append(redChip3)
        redChipArray.append(redChip4)
        
        
        let blackChip = Chip(frame: CGRect(x: 320, y: 760, width: chipWidth, height: chipHeight), chipType: .black)
        self.addSubview(blackChip)
        let blackChip2 = Chip(frame: CGRect(x: 320, y: 740, width: chipWidth, height: chipHeight), chipType: .black)
        self.addSubview(blackChip2)
        let blackChip3 = Chip(frame: CGRect(x: 320, y: 720, width: chipWidth, height: chipHeight), chipType: .black)
        self.addSubview(blackChip3)
        let blackChip4 = Chip(frame: CGRect(x: 320, y: 700, width: chipWidth, height: chipHeight), chipType: .black)
        self.addSubview(blackChip4)
        
        draggapleChipBlack = blackChip4
        
        blackChipArray.append(blackChip)
        blackChipArray.append(blackChip2)
        blackChipArray.append(blackChip3)
        blackChipArray.append(blackChip4)
        
        
        let greenChip = Chip(frame: CGRect(x: 220, y: 760, width: chipWidth, height: chipHeight), chipType: .green)
        self.addSubview(greenChip)
        let greenChip2 = Chip(frame: CGRect(x: 220, y: 740, width: chipWidth, height: chipHeight), chipType: .green)
        self.addSubview(greenChip2)
        let greenChip3 = Chip(frame: CGRect(x: 220, y: 720, width: chipWidth, height: chipHeight), chipType: .green)
        self.addSubview(greenChip3)
        let greenChip4 = Chip(frame: CGRect(x: 220, y: 700, width: chipWidth, height: chipHeight), chipType: .green)
        self.addSubview(greenChip4)
        
        draggableChipGreen = greenChip4
        
        greenChipArray.append(greenChip)
        greenChipArray.append(greenChip2)
        greenChipArray.append(greenChip3)
        greenChipArray.append(greenChip4)
        
        
        addGestureRecognizerToChip(chip: blueChip4)
        addGestureRecognizerToChip(chip: greenChip4)
        addGestureRecognizerToChip(chip: redChip4)
        addGestureRecognizerToChip(chip: blackChip4)
        
        
        
        
        
        highlightedView = UIView(frame: CGRect(x: 0, y: -45, width: 414, height: 420))
        highlightedView.backgroundColor = UIColor(displayP3Red: 255, green: 255, blue: 237, alpha: 1)
        highlightedView.alpha = 0
        self.addSubview(highlightedView)
        
    }
    
    
    func showBidButtons()  {
        if cancelButton.isHidden {
            
            self.cancelButton.alpha = 0
            self.raiseButton.alpha = 0
            self.cancelButton.isHidden = false
            self.raiseButton.isHidden = false
            
            UIView.animate(withDuration: 0.5, animations: {
 
                self.cancelButton.alpha = 1
                self.raiseButton.alpha = 1
            })
        }
        
    }

    func highlightView() {
        UIView.animate(withDuration: 0.5, animations: {
                    self.highlightedView.alpha = 0.2
        }, completion: { (finished: Bool) in
            self.unhighlightView()

        })
    }
    
    
    func unhighlightView() {
        UIView.animate(withDuration: 0.5, animations: {
            self.highlightedView.alpha = 0
        }, completion: { (finished: Bool) in
            if self.shouldHighlight {

                self.highlightView()
            }
        })
    }
    

    
    @objc func callButtonPressed() {
        print("call pressed ")

        
    }
    
    @objc func foldButtonPressed() {
        
        if let topController = UIApplication.topViewController() as? GameViewController {
            topController.goToNextPlayer()
        }
    }
    
    @objc func raiseButtonPressed() {
        
        
        if let topController = UIApplication.topViewController() as? GameViewController {
            topController.addToPot(chips: chipsToBid)
        }
    }
    
    @objc func cancelPressed() {
        print(" cancel pressed")
        
        
        for chip in chipsToBid{
            addChipToStack(chip: chip)
        }
        chipsToBid.removeAll()
    }
    
    //commit
    

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
 

}
