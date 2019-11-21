//
//  playerContentView.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/20/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class playerContentView: UIView {
    var redChipArray: [Chip] = []
    var blueChipArray: [Chip] = []
    var blackChipArray: [Chip] = []
    var greenChipArray: [Chip] = []
    var currentValue: Double = 0

    
    var player: String?
    
     init(frame: CGRect, name: String) {
        super.init(frame: frame)
        player = name
        displayView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func displayView(){
        let callButton = UIButton(frame: CGRect(x: 30, y: 430, width: 150, height: 50))
        
        callButton.setTitle("Call/Check", for: .normal)
        callButton.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        callButton.addTarget(self, action: #selector(callButtonPressed), for: .touchUpInside)
        callButton.layer.cornerRadius = 5
        callButton.layer.borderWidth = 1
        callButton.layer.borderColor = UIColor.white.cgColor
        callButton.backgroundColor = UIColor.blue
        callButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(callButton)
        
        let foldButton = UIButton(frame: CGRect(x: 240, y: 430, width: 150, height: 50))
        
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
        
        let raiseButton = UIButton(frame: CGRect(x: 30, y: 510, width: 150, height: 50))
        
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
        
        let cancel = UIButton(frame: CGRect(x:240, y: 510, width: 150, height: 50))
        
        cancel.setTitle("Reset", for: .normal)
        cancel.titleLabel!.font = UIFont (name: "Gurmukhi MN", size: 20)
        cancel.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        cancel.layer.cornerRadius = 5
        cancel.layer.borderWidth = 1
        cancel.layer.borderColor = UIColor.white.cgColor
        //cancel.titleLabel?.textColor = UIColor.red
        cancel.setTitleColor(.white, for: .normal)
        cancel.backgroundColor  = UIColor.init(displayP3Red: 255, green: 0, blue: 0, alpha: 0.5)
        cancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(cancel)
        
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
        
        let playerTitle = UILabel(frame: CGRect(x: 120, y: 10, width: 200, height: 100))
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
        
        var chipWidth = 75
        var chipHeight = 75
        
        
        let blueChip = Chip(frame: CGRect(x: 10, y: 760, width: chipWidth, height: chipHeight), chipType: .blue)
        self.addSubview(blueChip)
        let blueChip2 = Chip(frame: CGRect(x: 10, y: 740, width: chipWidth, height: chipHeight), chipType: .blue)
        self.addSubview(blueChip2)
        let blueChip3 = Chip(frame: CGRect(x: 10, y: 720, width: chipWidth, height: chipHeight), chipType: .blue)
        self.addSubview(blueChip3)
        let blueChip4 = Chip(frame: CGRect(x: 10, y: 700, width: chipWidth, height: chipHeight), chipType: .blue)
        self.addSubview(blueChip4)
        
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
        
        greenChipArray.append(greenChip)
        greenChipArray.append(greenChip2)
        greenChipArray.append(greenChip3)
        greenChipArray.append(greenChip4)
        
    }
    
    func optimize() {
        
    }
    
    
    
    
    @objc func callButtonPressed() {
        print("call pressed ")
    }
    
    @objc func foldButtonPressed() {
        print("fold pressed")
    }
    
    @objc func raiseButtonPressed() {
        print(" raise pressed")
    }
    
    @objc func cancelPressed() {
        print(" cancel pressed")
    }
    
    @objc func bidPressed() {
        print(" bid pressed")
    }
    
    

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
 

}
