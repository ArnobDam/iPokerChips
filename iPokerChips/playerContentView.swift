//
//  playerContentView.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 11/20/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class playerContentView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func displayView(){
        let callButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        
        callButton.setTitle("Call", for: .normal)
        callButton.addTarget(self, action: #selector(callButtonPressed), for: .touchUpInside)
        
        let foldButton = UIButton(frame: CGRect(x: 200, y: 100, width: 50, height: 50))
        
        foldButton.setTitle("Fold", for: .normal)
        foldButton.addTarget(self, action: #selector(foldButtonPressed), for: .touchUpInside)
        
        let raiseButton = UIButton(frame: CGRect(x: 300, y: 100, width: 50, height: 50))
        
        raiseButton.setTitle("Raise", for: .normal)
        raiseButton.addTarget(self, action: #selector(raiseButtonPressed), for: .touchUpInside)
        
        let cancel = UIButton(frame: CGRect(x: 10, y: 100, width: 50, height: 50))
        
        cancel.setTitle("Cancel", for: .normal)
        cancel.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        
        let bid = UIButton(frame: CGRect(x: 10, y: 100, width: 50, height: 50))
        
        bid.setTitle("bid", for: .normal)
        bid.addTarget(self, action: #selector(bidPressed), for: .touchUpInside)
        
        
//        creating labels
        
        let playerTitle = UILabel(frame: CGRect(x: 100, y: 10, width: 200, height: 100))
        
        let dragToRaise = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        
        dragToRaise.text = "Drag chip to raise!"
    
        
    }
    
    
    
    
    
    @objc func callButtonPressed() {
        
    }
    
    @objc func foldButtonPressed() {
        
    }
    
    @objc func raiseButtonPressed() {
        
    }
    
    @objc func cancelPressed() {
        
    }
    
    @objc func bidPressed() {
        
    }
    
    

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
 

}
