//
//  Character.swift
//  OOP-GAME
//
//  Created by Mostafijur Rahaman on 6/14/16.
//  Copyright © 2016 Mostafijur Rahaman. All rights reserved.
//

import Foundation

class Character{
    private var _hp: Int = 0
    private var _attackPwr: Int = 0
    
        
    var hp: Int{
        get{
            return _hp
        }
    }
    
    var attackPwr: Int{
        get{
            return _attackPwr
        }
    }
    
    var isAlive: Bool{
        get{
            if _hp <= 0{
                return false
            }else{
                return true
            }
        }
    }
    
    init(hp: Int, attackPwr: Int){
        self._hp = hp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool{
        self._hp -= attackPwr
        return true
    }
    
}