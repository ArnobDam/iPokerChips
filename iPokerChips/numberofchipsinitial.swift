//
//  File.swift
//  iPokerChips
//
//  Created by Manohar Pradhan on 11/22/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import Foundation

var currentHandSize : Double!

var nBlueChips : Int!
var nBlackChips : Int!
var nGreenChips: Int!
var nRedChips: Int!

var n1:Int = 20
var n2:Int = 10
var n3:Int = 10
var n4:Int = 10

var newhandsize: Int!
var newn1: Int!
var newn2: Int!



func numberOfChips(startingHandSize : Int) -> [Chip.chipType:Int] {

if (startingHandSize == 50){
    nBlueChips = n4*2
    print("You have \"\(String(describing: nBlueChips))\" blue Chips")
    newhandsize = startingHandSize - n4;
    newn1 = newhandsize/2; // 20
    newn2 = newhandsize - newn1;
    nRedChips = newn1/2;
    nGreenChips = newn2/5;
    print("You have \"\(String(describing: nRedChips))\" red Chips")
    print("You have \"\(nGreenChips)\" green chips")

}
if (startingHandSize == 100) {
    nBlueChips = 10*2;
    print("You have \"\(nBlueChips)\" blue Chips")
    newhandsize = startingHandSize - n4;
    let redhandsize = newhandsize - 70;
    nRedChips = redhandsize / 1;
    print("You have \"\(nRedChips)\" red Chips")
    let greenhandsize = 30;
    nGreenChips =  30/5;
    print("You have \"\(nGreenChips)\" green chips")
    nBlackChips = 40/10;
    print("You have \"\(nBlackChips)\" black chips");
    
}
if (startingHandSize == 500 ){
nBlueChips = 25*2;
print("You have \"\(nBlueChips)\" blue Chips")
nRedChips = 75;
nGreenChips = 100/5;
nBlackChips = 300/10;
print("You have \"\(nRedChips)\" red chips");
print("You have \"\(nGreenChips)\" green chips");
print("You have \"\(nBlackChips)\" black chips");
}

if (startingHandSize == 1000){
 nBlueChips = 25*2;
 print("You have \"\(nBlueChips)\" blue chips");
    nRedChips = 100;
    print("You have \"\(nRedChips)\" red chips");
    nGreenChips = 225/5;
    print("You have \"\(nGreenChips)\" green chips");
    nBlackChips = 650/10;
    print("You have \"\(nBlackChips)\" black chips");
    
    }
    
    var returnChips:[Chip.chipType:Int] = [:]
    returnChips[Chip.chipType.blue] = nBlueChips
    returnChips[Chip.chipType.red] = nRedChips
    returnChips[Chip.chipType.green] = nGreenChips
    returnChips[Chip.chipType.black] = nBlackChips
    return returnChips


}
