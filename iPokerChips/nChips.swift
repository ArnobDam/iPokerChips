//
//  File.swift
//  iPokerChips
//
//  Created by Arnob Dam on 11/22/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import Foundation

//parameter this takes in is Current Hand Size ($)
class nChips {

    init (){
        
    let currentDollarHandSize = 1.05
    var startingHandSize: String!
    var nBlueChips: Int!
    var nRedChips: Int!
    var nGreenChips: Int!
    var nBlackChips: Int!
        
    let n1 = 10
    let n2 = 20
    let n3 = 30
    let n4 = 40
        
        var R1: Float!
        var R2: Float!
        var R3: Float!
        var R4: Float!
        
    if (startingHandSize == "$10") {
        
        
        if (currentDollarHandSize <= 1.00){
            nRedChips = 0
            nGreenChips = 0
            nBlackChips = 0
            
            nBlueChips = Int(currentDollarHandSize/0.05)
            
        }
        if (currentDollarHandSize > 1.00 && currentDollarHandSize <= 3.00){
            nBlueChips = 20
            nGreenChips = 0
            nBlackChips = 0
            
            let newHS = currentDollarHandSize - Double(n1)
            nRedChips = Int(newHS/0.1)
            R1 = Float(newHS.truncatingRemainder(dividingBy: 0.1))
            nBlueChips += Int(R1)
            print(nBlueChips)
            
        }
        if (currentDollarHandSize > 3.00 && currentDollarHandSize <= 7.00){
            
        }
        if (currentDollarHandSize > 7.00 && currentDollarHandSize <= 10.00){
            
        }
        if (currentDollarHandSize > 10.00){
            
        }
    }

}

}






