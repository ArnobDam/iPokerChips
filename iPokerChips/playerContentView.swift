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
    
    
    var handSize: Double?

    var redChipArray1: [Chip] = []
    var redChipArray2: [Chip] = []
    var redChipArray3: [Chip] = []
    
    
    var blueChipArray1: [Chip] = []
    var blueChipArray2: [Chip] = []
    var blueChipArray3: [Chip] = []
    
    
    
    var greenChipArray1: [Chip] = []
    var greenChipArray2: [Chip] = []
    var greenChipArray3: [Chip] = []
    
    
    
    var blackChipArray1: [Chip] = []
    var blackChipArray2: [Chip] = []
    var blackChipArray3: [Chip] = []
    
    var redChipArray: [[Chip]] = []
    var blueChipArray: [[Chip]] = []
    var blackChipArray: [[Chip]] = []
    var greenChipArray: [[Chip]] = []
    
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
    
    
    
    init(frame: CGRect, name: String, startingHandsize:Double) {
        super.init(frame: frame)
        player = name
        handSize = startingHandsize
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
        
        let chip = recognizer.view as! Chip


        self.newCoord = recognizer.location(in: self)
        let x = self.newCoord.x - chip.frame.width / 2
        let y = self.newCoord.y - chip.frame.height / 2
        chip.frame = CGRect(x: x, y: y, width: chip.frame.width, height: chip.frame.height)
        
        if (recognizer.state == UIGestureRecognizer.State.began) {
            highlightView()
            shouldHighlight = true
            self.bringSubviewToFront(chip)
            
        }
        
        else if (recognizer.state == UIGestureRecognizer.State.ended) {
            shouldHighlight = false
            if (y < 500) {
                moveChipToPot(chip: chip)
                removeChipFromStack(chip:chip)
                chipsToBid.append(chip)
                showBidButtons()
               
            }
            else {
                if chip.isInStack {
                        moveChipTo(chip: chip, frame: chip.frameInStack)
                }
                else {
                
                
                addChipToStack(chip: chip)
                if let index = chipsToBid.firstIndex(of: chip) {
                    chipsToBid.remove(at: index)
                }
                }
                
            }
        }
        
        
    }

    
    
    func addChipToStack (chip:Chip) {
        
        chip.isInStack = true
        if chip.selfchipType == Chip.chipType.blue{
            


            
            var xPos = 0
            var yPos = 0
            
            if blueChipArray[0].count < 10 {
                blueChipArray[0].append(chip)
               xPos =  10
                yPos = 780 - blueChipArray[0].count*20
                
                if blueChipArray[0].count > 1{
                    let previousChip = blueChipArray[0][blueChipArray[0].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            else if blueChipArray[1].count < 10 {
                blueChipArray[1].append(chip)

               xPos = 40
                yPos = 780 - blueChipArray[1].count*20
                
                if blueChipArray[1].count > 1{
                    let previousChip = blueChipArray[1][blueChipArray[1].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }

            }
            else {
                blueChipArray[2].append(chip)

                xPos = -30
                yPos = 780 - blueChipArray[2].count*20
                
                
                if blueChipArray[2].count > 1{
                    let previousChip = blueChipArray[2][blueChipArray[2].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }

            }
           // let xpos = Double((blueChipArray.count - 1)/10).rounded(.down)
            let frame = CGRect(x: CGFloat(xPos), y: CGFloat(yPos), width: chipWidth, height: chipHeight)
            moveChipTo(chip: chip, frame: frame)

            }
        
        
        
        if chip.selfchipType == Chip.chipType.red{
            

        
            var xPos = 0
            var yPos = 0
            
            if redChipArray[0].count < 10 {
                redChipArray[0].append(chip)
                xPos =  120
                yPos = 780 - redChipArray[0].count*20
                
                if redChipArray[0].count > 1{
                    let previousChip = redChipArray[0][redChipArray[0].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            else if redChipArray[1].count < 10 {
                redChipArray[1].append(chip)
                xPos = 150
                yPos = 780 - redChipArray[1].count*20
                
                
                if redChipArray[1].count > 1{
                    let previousChip = redChipArray[1][redChipArray[1].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            else {
                
                redChipArray[2].append(chip)

                xPos = 90
                yPos = 780 - redChipArray[2].count*20
                
                
                if redChipArray[2].count > 1{
                    let previousChip = redChipArray[2][redChipArray[2].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            
            // let xpos = Double((blueChipArray.count - 1)/10).rounded(.down)
            
            let frame = CGRect(x: CGFloat(xPos), y: CGFloat(yPos), width: chipWidth, height: chipHeight)
            moveChipTo(chip: chip, frame: frame)
            

        }
        

        if chip.selfchipType == Chip.chipType.black{
            

            var xPos = 0
            var yPos = 0
            
            if blackChipArray[0].count < 10 {
                blackChipArray[0].append(chip)
                xPos =  320
                yPos = 780 - blackChipArray[0].count*20
                
                
                if blackChipArray[0].count > 1{
                    let previousChip = blackChipArray[0][blackChipArray[0].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            else if blackChipArray[1].count < 10 {
                blackChipArray[1].append(chip)
                xPos = 350
                yPos = 780 - blackChipArray[1].count*20
                
                if blackChipArray[1].count > 1{
                    let previousChip = blackChipArray[1][blackChipArray[1].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            else {
                
                blackChipArray[2].append(chip)
                
                xPos = 290
                yPos = 780 - blackChipArray[2].count*20
                
                if blackChipArray[2].count > 1{
                    let previousChip = blackChipArray[2][blackChipArray[2].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            
            // let xpos = Double((blueChipArray.count - 1)/10).rounded(.down)
            
            let frame = CGRect(x: CGFloat(xPos), y: CGFloat(yPos), width: chipWidth, height: chipHeight)
            moveChipTo(chip: chip, frame: frame)

        }
        
        
        if chip.selfchipType == Chip.chipType.green{
            
            var xPos = 0
            var yPos = 0
            
            if greenChipArray[0].count < 10 {
                greenChipArray[0].append(chip)
                xPos =  220
                yPos = 780 - greenChipArray[0].count*20
                
                
                if greenChipArray[0].count > 1{
                    let previousChip = greenChipArray[0][greenChipArray[0].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            else if greenChipArray[1].count < 10 {
                greenChipArray[1].append(chip)
                xPos = 250
                yPos = 780 - greenChipArray[1].count*20

                if greenChipArray[1].count > 1{
                    let previousChip = greenChipArray[1][greenChipArray[1].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            else {
                
                greenChipArray[2].append(chip)
                
                xPos = 190
                yPos = 780 - greenChipArray[2].count*20
                
                if greenChipArray[2].count > 1{
                    let previousChip = greenChipArray[2][greenChipArray[2].count - 2]
                    previousChip.gestureRecognizers?.forEach(previousChip.removeGestureRecognizer)
                }
                
            }
            
            // let xpos = Double((blueChipArray.count - 1)/10).rounded(.down)
            
            let frame = CGRect(x: CGFloat(xPos), y: CGFloat(yPos), width: chipWidth, height: chipHeight)
            moveChipTo(chip: chip, frame: frame)
            
        }
        
        chip.frameInStack = chip.frame
        self.bringSubviewToFront(chip)
        
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
        chip.isInStack = false
        
        if chip.selfchipType == Chip.chipType.blue{
            
            for i in 0...blueChipArray.count-1 {
            if let index = blueChipArray[i].firstIndex(of: chip) {
                blueChipArray[i].remove(at: index)
                if blueChipArray[i].count > 0 {
                    addGestureRecognizerToChip(chip: blueChipArray[i][blueChipArray[i].count - 1])
                }
            }
        }
        }
        
        
        
        if chip.selfchipType == Chip.chipType.red{
            for i in 0...redChipArray.count-1 {

            if let index = redChipArray[i].firstIndex(of: chip) {
                redChipArray[i].remove(at: index)
                if redChipArray[i].count > 0 {
                    addGestureRecognizerToChip(chip: redChipArray[i][redChipArray[i].count - 1])
                }
            }
        }
        }
        
        
        if chip.selfchipType == Chip.chipType.black{
            for i in 0...blackChipArray.count-1 {

            if let index = blackChipArray[i].firstIndex(of: chip) {
                blackChipArray[i].remove(at: index)
                if blackChipArray[i].count > 0 {
                    addGestureRecognizerToChip(chip: blackChipArray[i][blackChipArray[i].count - 1])
                }
            }
        }
        }
        
        
        if chip.selfchipType == Chip.chipType.green{
            
            for i in 0...greenChipArray.count-1 {

            if let index = greenChipArray[i].firstIndex(of: chip) {
                greenChipArray[i].remove(at: index)
                if greenChipArray[i].count > 0 {
                    addGestureRecognizerToChip(chip: greenChipArray[i][greenChipArray[i].count - 1])
                }
            }
        }
        }
        
    }

    
    func moveChipToPot(chip:Chip) {
        
        UIView.animate(withDuration: 0.7, animations: {
            
            let r = Double.random(in: 0..<75)
            let theta = Double.random(in: -180..<0)
            
            let y = r*sin(theta * Double.pi / 180)
            let x = r*cos(theta * Double.pi / 180)
            chip.frame = CGRect(x: CGFloat(Double(UIScreen.main.bounds.width/2) - 20 + x ), y:CGFloat( 480 + y), width: 40, height: 40)
        })
    }
    
    func addChipsFromPot(chips:[Chip]) {
        
        for chip in chips{
            
            self.addSubview(chip)
            addChipToStack(chip: chip)
            if chip.gestureRecognizers?.count == 0 {
                addGestureRecognizerToChip(chip:chip)
            }
        }
        
    }
    
    var raiseButton:UIButton!
    var callButton:UIButton!
    var foldButton:UIButton!
    var cancelButton:UIButton!
    var allInButton:UIButton!

    
    
    func displayView(){
        callButton =   UIButton(frame: CGRect(x:30, y: 525, width: 100, height: 50))
        
        callButton.setTitle("Call", for: .normal)
        callButton.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        callButton.addTarget(self, action: #selector(callButtonPressed), for: .touchUpInside)
        callButton.layer.cornerRadius = 5
        callButton.layer.borderWidth = 1
        callButton.layer.borderColor = UIColor.white.cgColor
        callButton.backgroundColor = UIColor.blue
        callButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(callButton)
        
        
        allInButton =   UIButton(frame: CGRect(x:290, y: 525, width: 100, height: 50))
        
        allInButton.setTitle("All In!", for: .normal)
        allInButton.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        allInButton.addTarget(self, action: #selector(allInButtonPressed), for: .touchUpInside)
        allInButton.layer.cornerRadius = 5
        allInButton.layer.borderWidth = 1
        allInButton.layer.borderColor = UIColor.white.cgColor
        allInButton.backgroundColor = UIColor.blue
        allInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(allInButton)
        
        
        
        
        foldButton = UIButton(frame: CGRect(x: 160, y: 525, width: 100, height: 50))
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
        
        
        
        raiseButton = UIButton(frame: CGRect(x: 320, y: 400, width: 80, height: 30))
        raiseButton.setTitle("Bet", for: .normal)
        raiseButton.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        raiseButton.addTarget(self, action: #selector(raiseButtonPressed), for: .touchUpInside)
        raiseButton.layer.cornerRadius = 5
        raiseButton.layer.borderWidth = 1
        raiseButton.layer.borderColor = UIColor.white.cgColor
        raiseButton.setTitleColor(.white, for: .normal)
        raiseButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        raiseButton.backgroundColor  = UIColor.black
        self.addSubview(raiseButton)
        raiseButton.isHidden = true
        
        
        cancelButton = UIButton(frame: CGRect(x: 20, y: 400, width: 80, height: 30))
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

        let playerTitle = UILabel(frame: CGRect(x: 136, y: -49, width: 150, height: 150
        ))
        playerTitle.text = player
        playerTitle.font = UIFont (name: "Gurmukhi MN", size: 30)
        playerTitle.textColor = UIColor.white
        playerTitle.textAlignment = .center
        self.addSubview(playerTitle)
        
        let dragToRaise = UILabel(frame: CGRect(x: 130, y: 300, width: 200, height: 100))
        dragToRaise.text = "Drag chip to raise!"
        dragToRaise.font = UIFont(name: "Gurmukhi MN", size: 20)
        dragToRaise.textColor = UIColor.white
        dragToRaise.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(dragToRaise)
        
        redChipArray = [redChipArray1, redChipArray2, redChipArray3]
        blueChipArray = [blueChipArray1, blueChipArray2, blueChipArray3]
        greenChipArray = [greenChipArray1, greenChipArray2, greenChipArray3]
        blackChipArray = [blackChipArray1, blackChipArray2, blackChipArray3]
        
        var chipNums:[Chip.chipType:Int]  = [:]
        if handSize == Double(10) {
            print("its 10")
            chipNums = numberOfChips10(currentDollarHandSize: handSize!)
        }
        else if handSize == 50 {
            chipNums = numberOfChips50(currentDollarHandSize: handSize!)

        }
        else if handSize == 100 {
            chipNums = numberOfChips100(currentDollarHandSize: handSize!)

        }
        else if handSize == 500 {
            chipNums = numberOfChips500(currentDollarHandSize: handSize!)

        }
        else if handSize == 1000 {
            chipNums = numberOfChips1000(currentDollarHandSize: handSize!)

        }
        print(handSize)
        
        for (chipType,num) in chipNums {
            for i in 1...num {
                let chip = Chip(frame: CGRect(x: 214, y: 700, width: chipHeight, height: chipHeight), chipType: chipType)
                addGestureRecognizerToChip(chip: chip)
                self.addSubview(chip)
                addChipToStack(chip: chip)
            }
        }
        
        

        
        
        
        
        highlightedView = UIView(frame: CGRect(x: 0, y: -45, width: 414, height: 560))
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
    
    
    func hideBidButtons()  {
        if !cancelButton.isHidden {
            
            self.cancelButton.alpha = 1
            self.raiseButton.alpha = 1

            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.cancelButton.alpha = 0
                self.raiseButton.alpha = 0
            },completion: { (finished: Bool) in
                self.cancelButton.isHidden = true
                self.raiseButton.isHidden = true
                
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
    }

    @objc func allInButtonPressed() {
        print("call pressed ")
        
        
        var chipsToPutInPot:[Chip] = []
        
        for i in 0...blueChipArray.count - 1 {
            
            for chip in blueChipArray[i] {
                chipsToBid.append(chip)
                chipsToPutInPot.append(chip)
                addGestureRecognizerToChip(chip: chip)

            }
            blueChipArray[i] .removeAll()
        }
        for i in 0...redChipArray.count - 1 {
            for chip in redChipArray[i] {
                chipsToBid.append(chip)
                chipsToPutInPot.append(chip)
                addGestureRecognizerToChip(chip: chip)
            }
            redChipArray[i].removeAll()

        }
        for i in 0...greenChipArray.count - 1 {
            for chip in greenChipArray[i] {
                chipsToBid.append(chip)
                chipsToPutInPot.append(chip)
                addGestureRecognizerToChip(chip: chip)
            }
            greenChipArray[i].removeAll()

        }

        for i in 0...blackChipArray.count - 1 {
            for chip in blackChipArray[i] {
                chipsToBid.append(chip)
                chipsToPutInPot.append(chip)
                addGestureRecognizerToChip(chip: chip)
                
            }
            blackChipArray[i].removeAll()
        }
        
        chipsToPutInPot.shuffle()
        for chip in chipsToPutInPot {
            self.bringSubviewToFront(chip)
            chip.isInStack = false
            moveChipToPot(chip: chip)
        }
        
        showBidButtons()


        /*
        if let topController = UIApplication.topViewController() as? GameViewController {
            topController.addToPot(chips: chipsToBid)
        }
*/

        
    }
    
    @objc func foldButtonPressed() {
        for chip in chipsToBid{
            addChipToStack(chip: chip)
        }
        chipsToBid.removeAll()
        if let topController = UIApplication.topViewController() as? GameViewController {
            topController.addToPot(chips: self.chipsToBid)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                topController.goToNextPlayer()
            }
        }
    }
    
    @objc func raiseButtonPressed() {
        
        hideBidButtons()
        
            if let topController = UIApplication.topViewController() as? GameViewController {
                
                topController.addToPot(chips: self.chipsToBid)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    topController.goToNextPlayer()
                }
        }

    }
    
    @objc func cancelPressed() {
        hideBidButtons()

        
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
