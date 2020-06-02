//
//  Card.swift
//  AssigmentByStanford
//
//  Created by Temp-Kiran on 09/05/20.
//  Copyright © 2020 Temp-Kiran. All rights reserved.
//

import Foundation

struct Card:Equatable
{
    let Number:Int
    let shape:Shape
    let shading:Shading
    let color:CardColor
    var isSelected = false
    var isCardMatched = false
}
