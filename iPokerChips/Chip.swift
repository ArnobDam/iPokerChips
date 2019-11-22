//
//  Chip.swift
//  iPokerChips
//
//  Created by Nicholas Deily on 11/20/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

public class Chip: UIImageView {
    
    
    var selfchipType:chipType!
    
    enum chipType: String {
        case blue = "BlueChip"
        case red = "RedChip"
        case green = "GreenChip"
        case black = "BlackChip"

    }
    

    
    init(frame: CGRect, chipType:chipType) {
        super.init(frame: frame)
        selfchipType = chipType
        self.image = UIImage(imageLiteralResourceName: chipType.rawValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
