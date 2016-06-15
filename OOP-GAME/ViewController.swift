//
//  ViewController.swift
//  OOP-GAME
//
//  Created by Mostafijur Rahaman on 6/14/16.
//  Copyright © 2016 Mostafijur Rahaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enemyImg: UIImageView!
    @IBOutlet weak var playerImg: UIImageView!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var playerHpLbl: UILabel!
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playerAttackBtn: UIButton!
    @IBOutlet weak var enemyAttackBtn: UIButton!
    @IBOutlet weak var textHolderImage: UIImageView!
    
    var player: Player!
    var enemy: Enemy!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initGame()
    }
    
    func randomEnemyGenerate(){
        let rand = Int(arc4random_uniform(UInt32(2)))
        if rand == 0{
            enemy = Karma(hp: 60, attackPwr: 12)
        }else if rand == 1{
            enemy = Devil(hp: 80, attackPwr: 15)
        }
    }
    
    func clearGame(){
        NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(ViewController.clearScreen), userInfo: nil, repeats: false)
        restartGame()
    }
    
    func restartGame(){
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(ViewController.game), userInfo: nil, repeats: false)

    }
    
    func clearScreen(){
        if enemyImg.hidden{
            playerImg.hidden = true
            playerHpLbl.text = ""
        }else{
            enemyImg.hidden = true
            enemyHpLbl.text = ""
        }
        
        printLbl.hidden = true
        textHolderImage.hidden = true
    }
    
    func game(){
        initGame()
        visibleGraphics()
    }
    
    func initGame(){
        player = Player(name: "Mostafij101", hp: 100, attackPwr: 15)
        randomEnemyGenerate()
        
        playerHpLbl.text = "\(player.hp) HP"
        enemyHpLbl.text = "\(enemy.hp) HP"
        printLbl.text = "Tapped Attack Button to Attack"
    }
    
    func visibleGraphics(){
        playerImg.hidden = false
        enemyImg.hidden = false
        printLbl.hidden = false
        textHolderImage.hidden = false
        playerAttackBtn.hidden = false
        enemyAttackBtn.hidden = false
    }
    
    func attackBtnsMutted(){
        playerAttackBtn.hidden = true
        enemyAttackBtn.hidden = true
    }

    @IBAction func attackToPlayer(sender: AnyObject) {
        if player.attemptAttack(enemy.attackPwr){
            playerHpLbl.text = "\(player.hp) HP"
            printLbl.text = "\(enemy.type) attacked by \(enemy.attackPwr) HP"
        }else{
            printLbl.text = "Attack was unsuccessful"
        }
        
        if !player.isAlive{
            printLbl.text = "\(enemy.type) Won!!!!"
            playerImg.hidden = true
            playerHpLbl.text = ""
            attackBtnsMutted()
            clearGame()
        }
    }

    @IBAction func attackToEnemy(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPwr){
            enemyHpLbl.text = "\(enemy.hp) HP"
            printLbl.text = "\(player.name) attacked by \(player.attackPwr)"
        }else{
            printLbl.text = "Attack was Unsuccessful"
        }
        
        if !enemy.isAlive{
            printLbl.text = "\(player.name) Won!!!!"
            enemyImg.hidden = true
            enemyHpLbl.text = ""
            attackBtnsMutted()
            clearGame()

        }
    }
}

