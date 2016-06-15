//
//  Karma.swift
//  OOP-GAME
//
//  Created by Mostafijur Rahaman on 6/14/16.
//  Copyright © 2016 Mostafijur Rahaman. All rights reserved.
//

import Foundation

class Karma: Enemy{
    let IMMUNE_MAX = 15
    
    override var type: String{
        get{
            return "Karma"
        }
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX{
            super.attemptAttack(attackPwr)
            return true
        }else{
            return false
        }
    }
}