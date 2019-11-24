//
//  nChips50.swift
//  iPokerChips
//
//  Created by Arnob Dam on 11/22/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import Foundation

func numberOfChips50 (currentDollarHandSize:Double) -> [Chip.chipType:Int] {
    
    //var startingHandSize: String!
    
    var nBlueChips: Double!
    var nRedChips: Double!
    var nGreenChips: Double!
    var nBlackChips: Double!
    
    let n1: Double = 5.00
    let n2: Double = 10.00
    let n3: Double = 15.00
    let n4: Double = 20.00
    
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
    
    
    
    if (currentDollarHandSize <= 5.00){
        nRedChips = 0
        nGreenChips = 0
        nBlackChips = 0
        
        newHS = currentDollarHandSize
        nBlueChips = Double(newHS/0.25)
        
    }
    else if (currentDollarHandSize > 5.00 && currentDollarHandSize <= 15.00){
        nBlueChips = 20
        
        nGreenChips = 0
        nBlackChips = 0
        
        newHS = currentDollarHandSize - n1
        nRedChips = Double(newHS/0.50)
        
        R1 = Double(newHS.truncatingRemainder(dividingBy: 0.50))
        additionalBlueChips = Double(R1 / 0.25)
        nBlueChips += additionalBlueChips
        
    }
    else if (currentDollarHandSize > 15.00 && currentDollarHandSize <= 30.00){
        nBlueChips = 20
        nRedChips = 20
        
        nBlackChips = 0
        
        newHS = currentDollarHandSize - (n1 + n2)
        nGreenChips = Double(newHS/2.50)
        
        R2 = Double(newHS.truncatingRemainder(dividingBy: 2.50))
        additionalRedChips = Double(R2 / 0.50)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 0.50))
        additionalBlueChips = Double(R1 / 0.25)
        nBlueChips += additionalBlueChips
    }
    else if (currentDollarHandSize > 30.00 && currentDollarHandSize <= 50.00){
        nBlueChips = 20
        nRedChips = 20
        nGreenChips = 6
        
        newHS = currentDollarHandSize - (n1 + n2 + n3)
        nBlackChips = Double(newHS/5.0)
        
        R3 = Double(newHS.truncatingRemainder(dividingBy: 5.0) )
        additionalGreenChips = Double(R3/2.50)
        nGreenChips += additionalGreenChips
        
        R2 = Double(R3.truncatingRemainder(dividingBy: 2.50))
        additionalRedChips = Double(R2 / 0.50)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 0.50))
        additionalBlueChips = Double(R1 / 0.25)
        nBlueChips += additionalBlueChips
    }
    else {
        nBlueChips = 20
        nRedChips = 20
        nGreenChips = 6
        nBlackChips = 4
        
        newHS = currentDollarHandSize - (n1 + n2 + n3 + n4)
        additionalBlackChips = Double(newHS/5.0)
        nBlackChips += additionalBlackChips
        
        R3 = Double(newHS.truncatingRemainder(dividingBy: 5.0) )
        additionalGreenChips = Double(R3/2.50)
        nGreenChips += additionalGreenChips
        
        R2 = Double(R3.truncatingRemainder(dividingBy: 2.50))
        additionalRedChips = Double(R2/0.50)
        nRedChips += additionalRedChips
        
        R1 = Double(R2.truncatingRemainder(dividingBy: 0.50))
        additionalBlueChips = Double(R1/0.25)
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
