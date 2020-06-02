//
//  ViewController.swift
//  AssigmentByStanford
//
//  Created by Temp-Kiran on 09/05/20.
//  Copyright © 2020 Temp-Kiran. All rights reserved.
//

import UIKit

//classs comment

class ViewController: UIViewController {
    
    
    @IBOutlet weak var matchedLable: UILabel!
    @IBOutlet var Barray: [UIButton]!
    @IBOutlet weak var UpdateScoreOfGame: UILabel!
    var score = 0
    {
        didSet
        {
            UpdateScoreOfGame.text="Score : \(score)"
        }
    }
    @IBOutlet var Add3Click:UIButton!
    var model:ModelClass!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model=ModelClass()
        showCards()
    }
    
    
    func showCards()
    {
        for i in Barray
        {
            if Barray.firstIndex(of: i)! < model.listOfSelectedArray.count && !model.listOfSelectedArray[Barray.firstIndex(of: i)!].isCardMatched
            {
                i.isHidden=false
                i.isEnabled=true
                switch model.listOfSelectedArray[Barray.firstIndex(of: i)!].color
                {
                case .red:
                    i.backgroundColor=UIColor.red
                    
                case .green:
                    i.backgroundColor=UIColor.green
                    
                case .purple:
                    i.backgroundColor=UIColor.purple
                    
                }
                
                
                
                var x = String(model.listOfSelectedArray[Barray.firstIndex(of: i)!].Number)
                
//                x+=" "
//                switch model.listOfSelectedArray[Barray.firstIndex(of: i)!].shape {
//                case let z where z == .dimond:
//                    x += String((z.rawValue)[(z.rawValue).startIndex])
//                case let z where z == .oval:
//                    x += String((z.rawValue)[(z.rawValue).startIndex])
//                case let z where z == .squiggle:
//                    x += String((z.rawValue)[(z.rawValue).startIndex])
//                default:
//                    break
//                }
                x += model.listOfSelectedArray[Barray.firstIndex(of: i)!].shape.rawValue
                switch model.listOfSelectedArray[Barray.firstIndex(of: i)!].shading {
                case let z where z == .open:
                    x += String((z.rawValue)[(z.rawValue).startIndex])
                case let z where z == .solid:
                    x += String((z.rawValue)[(z.rawValue).startIndex])
                case let z where z == .striped:
                    x += String((z.rawValue)[(z.rawValue).startIndex]).capitalized
                default:
                    break
                }
                
                i.setTitle(x, for: .normal)
                i.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
                
            }
            else{
                i.isHidden=true
            }
        }
    }
    
    @IBAction func Add3Clicked(_ sender: Any) {
        
        let x=model.add3Cards()
        
        if( x )
        {
            if model.isMatched
            {
                score+=3
            }
            else
            {
                score-=5
            }
        }
        showCards()
        
        if !model.isValidToAdd()
        {
            
            (sender as? UIButton)?.isEnabled=false
        }
        
    }
    @IBAction func tappedButton(_ sender: UIButton) {
        
        let temp = model.ChosenCards.count
        model.tappingHappend(Barray.firstIndex(of:sender)!)
        
        if model.ChosenCards.count==1 , temp==3 , model.checkIsSelected(Barray.firstIndex(of:sender)!)
        {
            if model.isMatched
            {
                score+=3
            }
            else
            {
                score-=5
            }
            showCards()
        }
        else if model.ChosenCards.count==3
        {
            for i in Barray
            {
                if i.isHidden==false,model.checkIsSelected(Barray.firstIndex(of:i)!)
                {
                    i.isEnabled=false
                }
            }
            
            
            
            if model.isValidToAdd()
            {
                Add3Click.isEnabled = model.ChosenCards.count==3 ? true : false
            }
        }

        if(model.checkIsSelected(Barray.firstIndex(of:sender)!))
        {
            sender.backgroundColor=UIColor.yellow
        }
        else
        {
            score-=1
            switch model.listOfSelectedArray[Barray.firstIndex(of: sender)!].color
            {
            case .red:
                sender.backgroundColor=UIColor.red
                
            case .green:
                sender.backgroundColor=UIColor.green
                
            case .purple:
                sender.backgroundColor=UIColor.purple
            }
        }
    }
    
}


//        var temp=model.ChosenCards.count
//        let shouldEnable = model.tappingHappend(Barray.firstIndex(of:sender)!)
//
//        if shouldEnable
//        {
//            Add3Click.isEnabled = model.ChosenCards.count==3 ? true : false
//
//            if(model.ChosenCards.count==1),temp==3,model.checkIsSelected(Barray.firstIndex(of:sender)!)
//            {
//                if model.isMatched
//                {
//                    score+=3
//                }
//                else
//                {
//                    score-=5
//                }
//                showCards()
//            }
//
//        }
//        else
//        {
//            if model.ChosenCards.count==1,temp==3,model.checkIsSelected(Barray.firstIndex(of:sender)!)
//            {
//                if model.isMatched
//                {
//                    score+=3
//                    hideSelected()
//
//                }
//                else
//                {
//                    score-=5
//                    showCards()
//                }
//            }
//
//        }
//
//        if(model.checkIsSelected(Barray.firstIndex(of:sender)!))
//        {
//            sender.backgroundColor=UIColor.yellow
//        }
//        else
//        {
//            score-=1
//            switch model.listOfSelectedArray[Barray.firstIndex(of: sender)!].color
//            {
//            case .red:
//                sender.backgroundColor=UIColor.red
//
//            case .green:
//                sender.backgroundColor=UIColor.green
//
//            case .purple:
//                sender.backgroundColor=UIColor.purple
//            }
//        }
//
//
//
//    func hideSelected()
//    {
//        for i in Barray
//        {
//            if i.backgroundColor==UIColor.yellow
//            {
//                i.isHidden=true
//            }
//        }
//    }
//
//}

