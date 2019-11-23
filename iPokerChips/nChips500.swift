//
//  nChips500.swift
//  iPokerChips
//
//  Created by Arnob Dam on 11/22/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import Foundation

func numberOfChips500 (currentDollarHandSize:Double) -> [Chip.chipType:Int] {
    
    
    
    var nBlueChips: Double!
    var nRedChips: Double!
    var nGreenChips: Double!
    var nBlackChips: Double!
    
    let n1: Double = 50.00
    let n2: Double = 100.00
    let n3: Double = 150.00
    let n4: Double = 200.00
    
    var newHS: Double!
    
    var R1: Double!
    var R2: Double!
    var R3: Double!
    var R4: Double!
    
    var additionalBlueChips: Double!
    var additionalRedChips: Double!
    var additionalGreenChips: Double!
    var additionalBlackChips: Double!
    //if (startingHandSize == "$10") {
    
    
    
    if (currentDollarHandSize <= 50.00){
        nRedChips = 0
        nGreenChips = 0
        nBlackChips = 0
        
        newHS = currentDollarHandSize
        nBlueChips = Double(newHS/2.50)
        
    }
    else if (currentDollarHandSize > 50.00 && currentDollarHandSize <= 150.00){
        nBlueChips = 20
        
        nGreenChips = 0
        nBlackChips = 0
        
        newHS = currentDollarHandSize - n1
        nRedChips = Double(newHS/5)
        
        R1 = Double(newHS.truncatingRemainder(dividingBy: 5))
        additionalBlueChips = Double(R1 / 2.50)
        nBlueChips += additionalBlueChips
        
    }
    else if (currentDollarHandSize > 150.00 && currentDollarHandSize <= 300.00){
        nBlueChips = 20
        nRedChips = 20
        
        nBlackChips = 0
        
        newHS = currentDollarHandSize - (n1 + n2)
        nGreenChips = Double(newHS/25)
        
        R2 = Double(newHS.truncatingRemainder(dividingBy: 25))
        additionalRedChips = Double(R2 / 5)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 5))
        additionalBlueChips = Double(R1 / 2.50)
        nBlueChips += additionalBlueChips
    }
    else if (currentDollarHandSize > 300.00 && currentDollarHandSize <= 500.00){
        nBlueChips = 20
        nRedChips = 20
        nGreenChips = 6
        
        newHS = currentDollarHandSize - (n1 + n2 + n3)
        nBlackChips = Double(newHS/50)
        
        R3 = Double(newHS.truncatingRemainder(dividingBy: 50) )
        additionalGreenChips = Double(R3/25)
        nGreenChips += additionalGreenChips
        
        R2 = Double(R3.truncatingRemainder(dividingBy: 25))
        additionalRedChips = Double(R2 / 5)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 5))
        additionalBlueChips = Double(R1 / 2.50)
        nBlueChips += additionalBlueChips
    }
    else {
        nBlueChips = 20
        nRedChips = 20
        nGreenChips = 6
        nBlackChips = 4
        
        newHS = currentDollarHandSize - (n1 + n2 + n3 + n4)
        additionalBlackChips = Double(newHS/50)
        nBlackChips += additionalBlackChips
        
        R3 = Double(newHS.truncatingRemainder(dividingBy: 50) )
        additionalGreenChips = Double(R3/25)
        nGreenChips += additionalGreenChips
        
        R2 = Double(R3.truncatingRemainder(dividingBy: 25))
        additionalRedChips = Double(R2/5)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 5))
        additionalBlueChips = Double(R1/2.50)
        nBlueChips += additionalBlueChips
    }
    //}
    //        print(newHS)
    //        print(R1)
    
    let blue = Int(nBlueChips.rounded())
    let red = Int(nRedChips.rounded())
    let green = Int(nGreenChips.rounded())
    let black = Int(nBlackChips.rounded())
    
    var chipNumbers:[Chip.chipType:Int] = [:]
    chipNumbers[.blue] = blue
    chipNumbers[.red] = red
    chipNumbers[.green] = green
    chipNumbers[.black] = black
    
    
    return chipNumbers
    
}
