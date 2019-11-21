//
//  playerContentView.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/20/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class playerContentView: UIView {
    
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
        let callButton = UIButton(frame: CGRect(x: 100, y: 500, width: 100, height: 50))
        
        callButton.setTitle("Call", for: .normal)
        callButton.addTarget(self, action: #selector(callButtonPressed), for: .touchUpInside)
        callButton.layer.cornerRadius = 5
        callButton.layer.borderWidth = 1
        callButton.layer.borderColor = UIColor.black.cgColor
        self.addSubview(callButton)
        
        let foldButton = UIButton(frame: CGRect(x: 200, y: 500, width: 100, height: 50))
        
        foldButton.setTitle("Fold", for: .normal)
        foldButton.addTarget(self, action: #selector(foldButtonPressed), for: .touchUpInside)
        foldButton.layer.cornerRadius = 5
        foldButton.layer.borderWidth = 1
        foldButton.layer.borderColor = UIColor.black.cgColor
        self.addSubview(foldButton)
        
        let raiseButton = UIButton(frame: CGRect(x: 300, y: 500, width: 100, height: 50))
        
        raiseButton.setTitle("Raise", for: .normal)
        raiseButton.addTarget(self, action: #selector(raiseButtonPressed), for: .touchUpInside)
        raiseButton.layer.cornerRadius = 5
        raiseButton.layer.borderWidth = 1
        raiseButton.layer.borderColor = UIColor.black.cgColor
        self.addSubview(raiseButton)
        
        let cancel = UIButton(frame: CGRect(x: 10, y: 100, width: 100, height: 50))
        
        cancel.setTitle("Cancel", for: .normal)
        cancel.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        cancel.layer.cornerRadius = 5
        cancel.layer.borderWidth = 1
        cancel.layer.borderColor = UIColor.black.cgColor
        self.addSubview(cancel)
        
        let bid = UIButton(frame: CGRect(x: 300, y: 100, width: 100, height: 50))
        
        bid.setTitle("bid", for: .normal)
        bid.addTarget(self, action: #selector(bidPressed), for: .touchUpInside)
        bid.layer.cornerRadius = 5
        bid.layer.borderWidth = 1
        bid.layer.borderColor = UIColor.black.cgColor
        self.addSubview(bid)
        
        
//        creating labels
        
        let playerTitle = UILabel(frame: CGRect(x: self.center.x - 100, y: 10, width: 200, height: 100))
        playerTitle.text = player
        playerTitle.font = UIFont(name: "guirmukhi", size: 20)
        playerTitle.textColor = UIColor.white
        self.addSubview(playerTitle)
        
        let dragToRaise = UILabel(frame: CGRect(x: 200, y: 100, width: 200, height: 100))
        dragToRaise.text = "Drag chip to raise!"
        dragToRaise.font = UIFont(name: "guirmukhi", size: 20)
        dragToRaise.textColor = UIColor.white
        self.addSubview(dragToRaise)
    
        
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
