//
//  Question.swift
//  Trivia
//
//  Created by Michael Haley on 1/14/17.
//  Copyright (c) 2017 Michael Haley. All rights reserved.
//

import UIKit

class Question {
    
    //MARK: Properties
    var question: String
    var A: String
    var B: String
    var C: String
    var ans: String //'A', 'B', or 'C'
    
    init(question: String, A: String, B: String, C: String, ans: String) {
        
        self.question = question
        self.A = A
        self.B = B
        self.C = C
        self.ans = ans
    
    }
}

