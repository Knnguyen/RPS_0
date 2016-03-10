//
//  ViewController.swift
//  RPS
//
//  Created by knn on 10/03/2016.
//  Copyright © 2016 knn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Buttom Variables
    @IBOutlet var rock: UIButton!
    @IBOutlet var paper: UIButton!
    @IBOutlet var scissors: UIButton!
    
    // Human-player options
    // Computer Auto-generated choices (Rock, Paper, Scissors)
    var userOption: GameChoice!
    var computerOption: GameChoice!
    
    // Constant- Variables: "Result Messages"
    let winnerMSG = [GameChoice.Rock: "Rock Crushes Scissors",
        GameChoice.Paper: "Paper Covers Rock",
        GameChoice.Scissors: "Scissors Cuts Paper"]
    
    let outcomeMSG = [ GameResult.Winner: ". You Win!",
        GameResult.Loser: ". You Loser!",
        GameResult.Tie: ". It's a Tie!"]
    
    // Function to filder the Actions, corresponding action
    @IBAction func makeChoice(sender: AnyObject) {
        
        switch(sender as! UIButton)
        {
        case rock:
            // process
            userOption = .Rock
            computerOption = GameChoice()
            ManageDisplayResult()
        case paper:
            // process
            userOption = .Paper
            computerOption = GameChoice()
            ManageDisplayResult()
        case scissors:
            // process
            userOption = .Scissors
            computerOption = GameChoice()
            ManageDisplayResult()
        default:
            print("Handle Value")
        }
    }
    
    
    // Function to Determine the Result of the 'duel'
    func gameResult(userOption:GameChoice, computerOption: GameChoice) ->GameResult
    {
        switch(userOption, computerOption)
        {
        case(GameChoice.Rock, GameChoice.Scissors), (GameChoice.Paper, GameChoice.Rock), (GameChoice.Scissors,GameChoice.Paper):
            return GameResult.Winner
            
        case(GameChoice.Scissors, GameChoice.Rock), (GameChoice.Rock,GameChoice.Paper), (GameChoice.Paper, GameChoice.Scissors):
            return GameResult.Loser
        default:
            return GameResult.Tie
        }
    }
    
    // Function to check and display outcomeMSG
    
    // .Winner: passes userOption
    // .Loser : passes computerOption
    func gameResultText(gameResult: GameResult) -> String
    {
        switch(gameResult)
        {
        case .Winner:
            return winnerMSG[userOption]! + outcomeMSG[gameResult]!
        case .Loser:
            return winnerMSG[computerOption]! + outcomeMSG[gameResult]!
        default:
            return outcomeMSG[gameResult]!
        }
    }
    
    // Function to Display Results
    /*
        Logic:
        1. get the result of the game
        2. get the result string + image string
        3. trigger the 'ResultViewController'
        4. pass it the result string + image string
    */
    func ManageDisplayResult()
    {
        // [Logic 1.]
        let myGameResult = gameResult(userOption, computerOption: computerOption)
        
        // [Logic 2.]
        let myResultString = gameResultText(myGameResult)
        
        // [Logic 3.]
        let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        
        // Requires "Storyboard ID"
        // THIS: myStoryBoard.instantiateViewControllerWithIdentifier("ResultView") as! ResultViewController
        
        // BECOMES: after create the above function as a CONSTANT
        let myResultVC = myStoryBoard.instantiateViewControllerWithIdentifier("ResultView") as! ResultViewController
        
        // Need to review this section
        // [Logic 4.]
        myResultVC.resultString = myResultString
        
        if myGameResult == GameResult.Tie
        {
            myResultVC.imageString = myResultString.stringByReplacingOccurrencesOfString(" ", withString: "")
        }
        else
        {
            let tempString = myResultString.stringByReplacingOccurrencesOfString(outcomeMSG[myGameResult]!, withString: "")
            
            myResultVC.imageString = tempString.stringByReplacingOccurrencesOfString(" ", withString: "")
        }
        
        self.presentViewController(myResultVC, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}

