//
//  Player.swift
//  OOP-GAME
//
//  Created by Mostafijur Rahaman on 6/14/16.
//  Copyright © 2016 Mostafijur Rahaman. All rights reserved.
//

import Foundation

class Player: Character{
    private var _name: String = "Player"
    
    var name: String{
        get{
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(hp: hp, attackPwr: attackPwr)
        self._name = name
    }
    
}