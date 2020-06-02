//
//  ModelClass.swift
//  AssigmentByStanford
//
//  Created by Temp-Kiran on 09/05/20.
//  Copyright © 2020 Temp-Kiran. All rights reserved.
//

import Foundation

enum Shape:String,CaseIterable,Hashable
{
    case dimond="♦️",squiggle="🔻",oval="🔴"
}
enum Shading:String,CaseIterable,Hashable
{
    case solid,striped,open
}
enum CardColor:String,CaseIterable,Hashable
{
    case red,green,purple
}

class ModelClass
{
    var listOfCards = [Card]()
    var cardItem:Card!
    var listOfSelectedArray=[Card]()
    var ChosenCards=[Int]()
    var isMatched=false
    init() {
        for i in 1...3
        {
            for j in Shape.allCases
            {
                for k in Shading.allCases
                {
                    for l in CardColor.allCases
                    {
                        cardItem=Card(Number: i, shape: j, shading: k, color: l)
                        listOfCards.append(cardItem)
                    }
                }
            }
        }
        
        listOfCards.shuffle()
        
        for _ in 0...11
        {
            listOfSelectedArray.append(listOfCards.remove(at: 0))
        }
    }
    
    func isASet()
    {
        var s1:Set<Int>=[]
        var s2:Set<Shape>=[]
        var s3:Set<Shading>=[]
        var s4:Set<CardColor>=[]
        
        for i in ChosenCards
        {
            s1.insert(listOfSelectedArray[i].Number)
            s2.insert(listOfSelectedArray[i].shape)
            s3.insert(listOfSelectedArray[i].shading)
            s4.insert(listOfSelectedArray[i].color)
        }
        
        if s1.count==2 || s2.count==2  || s3.count==2 || s4.count==2
        {
            isMatched=false
            
        }
        else
        {
            isMatched=true
            
            for i in ChosenCards
            {
                listOfSelectedArray[i].isCardMatched = true
            }
            
        }
        
        
        
        
    }
    
    
    
    func isValidToAdd()->Bool
    {
        if(listOfSelectedArray.count<24)
        {
            return true
        }
        else
        {
            return false
        }
    }
    func tappingHappend(_ card:Int)
    {
        
        if ChosenCards.count<3
        {
            if(listOfSelectedArray[card].isSelected==true)
            {
                listOfSelectedArray[card].isSelected=false
                ChosenCards.remove(at: ChosenCards.firstIndex(of: card)!)
            }
            else
            {
                listOfSelectedArray[card].isSelected=true
                ChosenCards.append(card)
            }
        }
        else
        {
            isASet()
            if isMatched
            {
                for i in ChosenCards
                {
                    //istOfSelectedArray[listOfSelectedArray.firstIndex(where: <#T##(Card) throws -> Bool#>)]
                    listOfSelectedArray[i].isSelected=false
                    listOfSelectedArray.remove(at: i)
                    if(listOfCards.count != 0 )
                    {
                        listOfSelectedArray.insert(listOfCards.remove(at: 0), at: i)
                    }
                }
            }
            else
            {
                for i in ChosenCards
                {
                    listOfSelectedArray[i].isSelected=false
                }
             
            }
            ChosenCards.removeAll()
            listOfSelectedArray[card].isSelected=true
            ChosenCards.append(card)
        }
    }
    
    
    //        if(isValidToAdd())
    //        {
    //            if ChosenCards.count<3
    //            {
    //                if(listOfSelectedArray[card].isSelected==true)
    //                {
    //                    listOfSelectedArray[card].isSelected=false
    //                    ChosenCards.remove(at: ChosenCards.firstIndex(of: card)!)
    //                }
    //                else
    //                {
    //                    listOfSelectedArray[card].isSelected=true
    //                    ChosenCards.append(card)
    //                }
    //            }
    //            else
    //            {
    //                isASet()
    //                if isMatched
    //                {
    //                    for i in ChosenCards
    //                    {
    //                        //istOfSelectedArray[listOfSelectedArray.firstIndex(where: <#T##(Card) throws -> Bool#>)]
    //                        listOfSelectedArray[i].isSelected=false
    //                        listOfSelectedArray.remove(at: i)
    //                        listOfSelectedArray.insert(listOfCards.remove(at: 0), at: i)
    //                    }
    //                }
    //                else
    //                {
    //                    for i in ChosenCards
    //                    {
    //                        //istOfSelectedArray[listOfSelectedArray.firstIndex(where: <#T##(Card) throws -> Bool#>)]
    //                        listOfSelectedArray[i].isSelected=false
    //                    }
    //
    //                }
   
    //
    //
    //            }
    //            return true
    //
    //        }
    //        else
    //        {
    //            if ChosenCards.count<3
    //            {
    //                if(listOfSelectedArray[card].isSelected==true)
    //                {
    //                    listOfSelectedArray[card].isSelected=false
    //                    ChosenCards.remove(at: ChosenCards.firstIndex(of: card)!)
    //                }
    //                else
    //                {
    //                    listOfSelectedArray[card].isSelected=true
    //                    ChosenCards.append(card)
    //                }
    //            }
    //            else
    //            {
    //                isASet()
    //                for i in ChosenCards
    //                {
    //
    //                    listOfSelectedArray[i].isSelected=false
    //                }
    //                ChosenCards.removeAll()
    //                listOfSelectedArray[card].isSelected=true
    //                ChosenCards.append(card)
    //
    //            }
    //            return false
    //        }
    
    
    func add3Cards() -> Bool {
        if ChosenCards.count != 0
        {
            isASet()
            if isMatched==true
            {
                
                for i in ChosenCards
                {
                    //istOfSelectedArray[listOfSelectedArray.firstIndex(where: <#T##(Card) throws -> Bool#>)]
                    listOfSelectedArray[i].isSelected=false
                    listOfSelectedArray.remove(at: i)
                    listOfSelectedArray.insert(listOfCards.remove(at: 0), at: i)
                }
                ChosenCards.removeAll()
                
                
            }
            else
            {
                for _ in 0...2
                {
                    listOfSelectedArray.append(listOfCards.remove(at: 0))
                }
                
            }
            
            return true
        }
        else
        {
            for _ in 0...2
            {
                listOfSelectedArray.append(listOfCards.remove(at: 0))
            }
            return false
        }
        
    }
    
    func checkIsSelected(_ card:Int)->Bool
    {
        return listOfSelectedArray[card].isSelected
        
    }
}
