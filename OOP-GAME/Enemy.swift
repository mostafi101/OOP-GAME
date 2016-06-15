//
//  Enemy.swift
//  OOP-GAME
//
//  Created by Mostafijur Rahaman on 6/14/16.
//  Copyright © 2016 Mostafijur Rahaman. All rights reserved.
//

import Foundation

class Enemy: Character{
    private var _type: String = "Enemy"
    
    var type: String{
        get{
            return _type
        }
    }
    
}