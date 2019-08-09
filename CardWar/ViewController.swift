//
//  ViewController.swift
//  YouTube_Coursje
//
//  Created by Jochem Vogel on 08/08/2019.
//  Copyright © 2019 Jochem Vogel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var tryAgainLabel: UILabel!
    
    var playerScore: Int = 0
    var GPUScore:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func dealTapped(_ sender: Any) {
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        let gameFinished: Bool = GPUScore == 10 || playerScore == 10
        
        if leftNumber > rightNumber && !gameFinished {
            playerScore += 1
            leftScoreLabel.text = String(playerScore)
                if playerScore == 10 {
                    winnerLabel.text = "Player won!"
                    tryAgainLabel.text = "Try Again?"
            }
        } else if rightNumber > leftNumber && !gameFinished {
            GPUScore += 1
            rightScoreLabel.text = String(GPUScore)
                if GPUScore == 10 {
                    winnerLabel.text = "GPU won!"
                    tryAgainLabel.text = "Try Again?"
            }
        }
    }
    
    @IBAction func startNewGame(_ sender: Any) {
        playerScore = 0
        GPUScore = 0
        
        leftScoreLabel.text = String(playerScore)
        rightScoreLabel.text = String(GPUScore)
        
        winnerLabel.text = ""
        
    }
}

