//
//  ViewController.swift
//  Trivia
//
//  Created by Michael Haley on 1/10/17.
//  Copyright (c) 2017 Michael Haley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {

    var vDidL = 0
    var count = 0
    var begin = 0

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var randomLabel: UILabel!
    @IBOutlet weak var buttonVar: UIButton!
    @IBOutlet weak var button1Var: UIButton!
    @IBOutlet weak var button2Var: UIButton!
    @IBOutlet weak var matchLabel: UILabel!
        
    @IBAction func button1(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTextField.delegate = self
        
        randomize()
        
        if(begin==0){
            begin=1
            starter()    
        }
        
    }
    
    var score = 0 //integer between 0 and 5
    
    @IBAction func buttonAction(sender: UIButton) {
        
        if(finalArray[count].ans=="A"){
            score++
            matchLabel.text = "Match"
        }
        else{
            matchLabel.text = "Wrong"
        }
        
        if count == 4 {
            randomize()
            changeQuestion(count)
            score = 0
            count = 0
        }
            
        else{
            changeQuestion(count)
            count++
        }
    }
    
    @IBAction func button1Action(sender: UIButton) {
        
        if(finalArray[count].ans=="B"){
            score++
            matchLabel.text = "Match"
        }
        else{
            matchLabel.text = "Wrong"
        }
        
        if count == 4 {
            randomize()
            changeQuestion(count)
            score = 0
            count = 0
        }
        else{
            changeQuestion(count)
            count++
            
        }
    }
    
    @IBAction func button2Action(sender: UIButton) {
        
        if(finalArray[count].ans=="C"){
            score++
            matchLabel.text = "Match"
        }
        else{
            matchLabel.text = "Wrong"
        }
        
        if count == 4 {
            randomize()
            changeQuestion(count)
            score = 0
            count = 0
        }
        else{
            changeQuestion(count)
            count++
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder() //Hide keyboard
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        myLabel.text = textField.text
    }
    
    var questionArray : [Question] = []
    var copyArray : [Question] = []
    var finalArray : [Question] = []
    
    func changeQuestion(index: Int) -> Int {
        
        var newIndex: Int
        
        if(index==4) {            
            newIndex = 0
        }
        else{
            newIndex = index + 1
        }

        myLabel.text = finalArray[newIndex].question
        buttonVar.setTitle(finalArray[newIndex].A, forState: .Normal)
        button1Var.setTitle(finalArray[newIndex].B, forState: .Normal)
        button2Var.setTitle(finalArray[newIndex].C, forState: .Normal)
        randomLabel.text = finalArray[newIndex].ans
        
        return 1
    }
    
    func starter() {
        
        myLabel.text = String(finalArray[0].question)
        buttonVar.setTitle(finalArray[0].A, forState: .Normal)
        button1Var.setTitle(finalArray[0].B, forState: .Normal)
        button2Var.setTitle(finalArray[0].C, forState: .Normal)
        randomLabel.text = finalArray[count].ans
    }
    
    func randomize() {
        
        questionArray.removeAll(keepCapacity: true)
        questionArray.append(Question(question: "Capital of MA?", A:"Quincy", B:"Plymouth", C:"Boston", ans: "C"))
        questionArray.append(Question(question: "Capital of NY?", A:"NYC", B:"Bronx", C:"Queens", ans: "A"))
        questionArray.append(Question(question: "Capital of WI?", A:"Green Bay", B:"Madison", C:"Milwaukee", ans: "B"))
        questionArray.append(Question(question: "Capital of PA?", A:"Pitt", B:"Philly", C:"Westchester", ans: "B"))
        questionArray.append(Question(question: "Capital of CT?", A:"Hartford", B:"Stamford", C:"Greenwich", ans: "A"))
        questionArray.append(Question(question: "Capital of CA?", A:"LA", B:"San Fran", C:"Sacremento", ans: "C"))
        questionArray.append(Question(question: "Capital of ME?", A:"Augusta", B:"Portland", C:"Bangor", ans: "A"))
        
        copyArray = questionArray
        finalArray = copyArray
        
        var rando: Int
        rando = questionArray.count
        var placeholder: Int
        
        //get 5 out of 7 questions in random order
        
        for i in 0...6{
            println(copyArray[i].question)
        }        
        
        placeholder =  random()%rando
        finalArray[0] = copyArray[placeholder]
        copyArray.removeAtIndex(placeholder)
        
        placeholder =  random()%(rando-1)
        finalArray[1] = copyArray[placeholder]
        copyArray.removeAtIndex(placeholder)
        
        placeholder =  random()%(rando-2)
        finalArray[2] = copyArray[placeholder]
        copyArray.removeAtIndex(placeholder)
        
        placeholder =  random()%(rando-3)
        finalArray[3] = copyArray[placeholder]
        copyArray.removeAtIndex(placeholder)
        
        placeholder =  random()%(rando-4)
        finalArray[4] = copyArray[placeholder]
        copyArray.removeAtIndex(placeholder)
        
        for i in 0...4{    
            println(finalArray[i].question)
        }
        
    }

}
