//
//  GameChoice.swift
//  RPS
//
//  Created by knn on 10/03/2016.
//  Copyright © 2016 knn. All rights reserved.
//

import Foundation

enum GameChoice
{
    // Maybe this is wrong.
    //case Rock
    //case Paper
    //case Scissors
    // ^ This notation is fine aswell.
    // on-edge due to unwanted results
    
    
    // Edit
    case Rock, Paper, Scissors
    
    init()
    {
        switch(arc4random_uniform(3))
        {
        case 0:
            self = Rock
        case 1:
            self = Paper
        default:
            self = Scissors
        }
    }
}