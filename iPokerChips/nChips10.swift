//
//  File.swift
//  iPokerChips
//
//  Created by Arnob Dam on 11/22/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import Foundation

//parameter this takes in is Current Hand Size ($)
func numberOfChips (currentDollarHandSize:Double) -> [Chip.chipType:Int] {
    
        var startingHandSize: String!
        
        var nBlueChips: Double!
        var nRedChips: Double!
        var nGreenChips: Double!
        var nBlackChips: Double!
        
        let n1: Double = 1.00
        let n2: Double = 2.00
        let n3: Double = 3.00
        let n4: Double = 4.00
        
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
    

        
        if (currentDollarHandSize <= 1.00){
            nRedChips = 0
            nGreenChips = 0
            nBlackChips = 0
            
            newHS = currentDollarHandSize
            nBlueChips = Double(newHS/0.05)
            
        }
        else if (currentDollarHandSize > 1.00 && currentDollarHandSize <= 3.00){
            nBlueChips = 20
            
            nGreenChips = 0
            nBlackChips = 0
            
            newHS = currentDollarHandSize - n1
            nRedChips = Double(newHS/0.1)
            
            R1 = Double(newHS.truncatingRemainder(dividingBy: 0.1))
            additionalBlueChips = Double(R1 / 0.05)
            nBlueChips += additionalBlueChips
            
        }
        else if (currentDollarHandSize > 3.00 && currentDollarHandSize <= 7.00){
            nBlueChips = 20
            nRedChips = 20
            
            nBlackChips = 0
            
            newHS = currentDollarHandSize - (n1 + n2)
            nGreenChips = Double(newHS/0.5)
            
            R2 = Double(newHS.truncatingRemainder(dividingBy: 0.5))
            additionalRedChips = Double(R2 / 0.1)
            nRedChips += additionalRedChips
            
            R1 = Double(R2.truncatingRemainder(dividingBy: 0.1))
            additionalBlueChips = Double(R1 / 0.05)
            nBlueChips += additionalBlueChips
        }
        else if (currentDollarHandSize > 7.00 && currentDollarHandSize <= 10.00){
            nBlueChips = 20
            nRedChips = 20
            nGreenChips = 6
            
            newHS = currentDollarHandSize - (n1 + n2 + n3)
            nBlackChips = Double(newHS/1.0)
            
            R3 = Double(newHS.truncatingRemainder(dividingBy: 1.0) )
            additionalGreenChips = Double(R3/0.5)
            nGreenChips += additionalGreenChips
            
            R2 = Double(R3.truncatingRemainder(dividingBy: 0.5))
            additionalRedChips = Double(R2 / 0.1)
            nRedChips += additionalRedChips
            
            R1 = Double(R2.truncatingRemainder(dividingBy: 0.1))
            additionalBlueChips = Double(R1 / 0.05)
            nBlueChips += additionalBlueChips
        }
        else {
            nBlueChips = 20
            nRedChips = 20
            nGreenChips = 6
            nBlackChips = 4
            
            newHS = currentDollarHandSize - (n1 + n2 + n3 + n4)
            additionalBlackChips = Double(newHS/1.0)
            nBlackChips += additionalBlackChips
            
            R3 = Double(newHS.truncatingRemainder(dividingBy: 1.0) )
            additionalGreenChips = Double(R3/0.5)
            nGreenChips += additionalGreenChips
            
            R2 = Double(R3.truncatingRemainder(dividingBy: 0.5))
            additionalRedChips = Double(R2/0.1)
            nRedChips += additionalRedChips
            
            R1 = Double(R2.truncatingRemainder(dividingBy: 0.1))
            additionalBlueChips = Double(R1/0.05)
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
    chipNumbers[.black] = black
    chipNumbers[.green] = green
    
    return chipNumbers

        }








