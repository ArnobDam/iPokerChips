//
//  File.swift
//  iPokerChips
//
//  Created by Arnob Dam on 11/22/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import Foundation

//parameter this takes in is Current Hand Size ($)
class nChips10 {

    init (){
        
        var currentDollarHandSize: Double = 0.95
        
        var startingHandSize: String!
        
        var nBlueChips: Int!
        var nRedChips: Int!
        var nGreenChips: Int!
        var nBlackChips: Int!
        
        let n1: Double = 1.00
        let n2: Double = 2.00
        let n3: Double = 3.00
        let n4: Double = 4.00
        
        var newHS: Double!
        
        var R1: Float!
        var R2: Float!
        var R3: Float!
        var R4: Float!
        
        var additionalBlueChips: Int!
        var additionalRedChips: Int!
        var additionalGreenChips: Int!
        var additionalBlackChips: Int!
        //if (startingHandSize == "$10") {
        
        
        if (currentDollarHandSize <= 1.00){
            nRedChips = 0
            nGreenChips = 0
            nBlackChips = 0
            
            newHS = currentDollarHandSize
            nBlueChips = Int(newHS/0.05)
            
        }
        else if (currentDollarHandSize > 1.00 && currentDollarHandSize <= 3.00){
            nBlueChips = 20
            
            nGreenChips = 0
            nBlackChips = 0
            
            newHS = currentDollarHandSize - n1
            nRedChips = Int(newHS/0.1)
            
            R1 = Float(newHS.truncatingRemainder(dividingBy: 0.1))
            additionalBlueChips = Int(R1 / 0.05)
            nBlueChips += additionalBlueChips
            
        }
        else if (currentDollarHandSize > 3.00 && currentDollarHandSize <= 7.00){
            nBlueChips = 20
            nRedChips = 20
            
            nBlackChips = 0
            
            newHS = currentDollarHandSize - (n1 + n2)
            nGreenChips = Int(newHS/0.5)
            
            R2 = Float(newHS.truncatingRemainder(dividingBy: 0.5))
            additionalRedChips = Int(R2 / 0.1)
            nRedChips += additionalRedChips
            
            R1 = Float(R2.truncatingRemainder(dividingBy: 0.1))
            additionalBlueChips = Int(R1 / 0.05)
            nBlueChips += additionalBlueChips
        }
        else if (currentDollarHandSize > 7.00 && currentDollarHandSize <= 10.00){
            nBlueChips = 20
            nRedChips = 20
            nGreenChips = 6
            
            newHS = currentDollarHandSize - (n1 + n2 + n3)
            nBlackChips = Int(newHS/1.0)
            
            R3 = Float(newHS.truncatingRemainder(dividingBy: 1.0) )
            additionalGreenChips = Int(R3/0.5)
            nGreenChips += additionalGreenChips
            
            R2 = Float(R3.truncatingRemainder(dividingBy: 0.5))
            additionalRedChips = Int(R2 / 0.1)
            nRedChips += additionalRedChips
            
            R1 = Float(R2.truncatingRemainder(dividingBy: 0.1))
            additionalBlueChips = Int(R1 / 0.05)
            nBlueChips += additionalBlueChips
        }
        else {
            nBlueChips = 20
            nRedChips = 20
            nGreenChips = 6
            nBlackChips = 4
            
            newHS = currentDollarHandSize - (n1 + n2 + n3 + n4)
            additionalBlackChips = Int(newHS/1.0)
            nBlackChips += additionalBlackChips
            
            R3 = Float(newHS.truncatingRemainder(dividingBy: 1.0) )
            additionalGreenChips = Int(R3/0.5)
            nGreenChips += additionalGreenChips
            
            R2 = Float(R3.truncatingRemainder(dividingBy: 0.5))
            additionalRedChips = Int(R2/0.1)
            nRedChips += additionalRedChips
            
            R1 = Float(R2.truncatingRemainder(dividingBy: 0.1))
            additionalBlueChips = Int(R1/0.05)
            nBlueChips += additionalBlueChips
        }
        //}
        //        print(newHS)
        //        print(R1)
        print(nBlueChips)
        print(nRedChips)
        print(nGreenChips)
        print(nBlackChips)
}

}






