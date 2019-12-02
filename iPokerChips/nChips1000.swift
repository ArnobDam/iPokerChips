//
//  nChips1000.swift
//  iPokerChips
//
//  Created by Arnob Dam on 11/22/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import Foundation

func numberOfChips1000 (currentDollarHandSize:Double) -> [Chip.chipType:Int] {
    
    var nBlueChips: Double!
    var nRedChips: Double!
    var nGreenChips: Double!
    var nBlackChips: Double!
    
    let n1: Double = 100.00
    let n2: Double = 200.00
    let n3: Double = 300.00
    let n4: Double = 400.00
    
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
    
    
    
    if (currentDollarHandSize <= 100.00){
        nRedChips = 0
        nGreenChips = 0
        nBlackChips = 0
        
        newHS = currentDollarHandSize
        nBlueChips = Double(newHS/5.00)
        
    }
    else if (currentDollarHandSize > 100.00 && currentDollarHandSize <= 300.00){
        nBlueChips = 20
        
        nGreenChips = 0
        nBlackChips = 0
        
        newHS = currentDollarHandSize - n1
        nRedChips = Double(newHS/10)
        
        R1 = Double(newHS.truncatingRemainder(dividingBy: 10))
        additionalBlueChips = Double(R1 / 5.00)
        nBlueChips += additionalBlueChips
        
    }
    else if (currentDollarHandSize > 300.00 && currentDollarHandSize <= 700.00){
        nBlueChips = 20
        nRedChips = 20
        
        nBlackChips = 0
        
        newHS = currentDollarHandSize - (n1 + n2)
        nGreenChips = Double(newHS/50)
        
        R2 = Double(newHS.truncatingRemainder(dividingBy: 50))
        additionalRedChips = Double(R2 / 10)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 10))
        additionalBlueChips = Double(R1 / 5.00)
        nBlueChips += additionalBlueChips
    }
    else if (currentDollarHandSize > 700.00 && currentDollarHandSize <= 1000.00){
        nBlueChips = 20
        nRedChips = 20
        nGreenChips = 6
        
        newHS = currentDollarHandSize - (n1 + n2 + n3)
        nBlackChips = Double(newHS/100)
        
        R3 = Double(newHS.truncatingRemainder(dividingBy: 100) )
        additionalGreenChips = Double(R3/50)
        nGreenChips += additionalGreenChips
        
        R2 = Double(R3.truncatingRemainder(dividingBy: 50))
        additionalRedChips = Double(R2 / 10)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 10))
        additionalBlueChips = Double(R1 / 5.00)
        nBlueChips += additionalBlueChips
    }
    else {
        nBlueChips = 20
        nRedChips = 20
        nGreenChips = 6
        nBlackChips = 4
        
        newHS = currentDollarHandSize - (n1 + n2 + n3 + n4)
        additionalBlackChips = Double(newHS/100)
        nBlackChips += additionalBlackChips
        
        R3 = Double(newHS.truncatingRemainder(dividingBy: 100) )
        additionalGreenChips = Double(R3/50)
        nGreenChips += additionalGreenChips
        
        R2 = Double(R3.truncatingRemainder(dividingBy: 50))
        additionalRedChips = Double(R2/10)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 10))
        additionalBlueChips = Double(R1/5.00)
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
