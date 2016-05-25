//
//  ViewController.swift
//  tapper
//
//  Created by Mindframe Mac on 5/23/16.
//  Copyright © 2016 Mindframe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Variables
    var maxTaps = 0 // can also be declared as var maxTaps = 0
    var currentTaps = 0 // can also be declared as var currentTaps = 0
    
    
    // The menu screen
    // Outlets
    @IBOutlet weak var logoImg: UIImageView! // The logo
    @IBOutlet weak var howManyTapsText: UITextField! // The text field
    @IBOutlet weak var playBtn: UIButton! // The play button
    
    // Pressing command + K will get rid of the keyboard
    
    // The play screen
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapLabel: UILabel!
    
    @IBAction func whenCoinTapped(sender: UIButton!){
        currentTaps++
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
        //tapLabel.text = "\(currentTaps) Taps" // this is bad practice, as it is repeating code
    }
    
    @IBAction func whenPlayButtonPressed(sender: UIButton!){ // What happens when the play button is pressed
        if (howManyTapsText.text != nil && howManyTapsText.text != ""){ // nil means null, or nothing, or empty
            initUI() // Init the UI of the app
            maxTaps = Int(howManyTapsText.text!)! // The exclamation points mean we are telling the compiler that we guarantee the values for the variable maxTaps. This is called unwrapping
            currentTaps = 0
            // tapLabel.text = "\(currentTaps) Taps" : bad practice, as this is repeating code
            updateTapsLabel()
            
        }
    }
    
    func restartGame(){
        maxTaps = 0
        howManyTapsText.text = ""
        logoImg.hidden = false
        playBtn.hidden = false
        howManyTapsText.hidden = false
        
        tapButton.hidden = true
        tapLabel.hidden = true
        
    }
    
    func isGameOver() -> Bool{
        if (currentTaps >= maxTaps){
            return true
        }
        else {
            return false
        }
    }
    
    func updateTapsLabel(){
        tapLabel.text = "\(currentTaps) Taps"
    }
    
    
    
    func initUI(){
        // Hide all the components from the main screen
        logoImg.hidden = true
        playBtn.hidden = true
        howManyTapsText.hidden = true
        // Show all the components from the play screen
        tapButton.hidden = false
        tapLabel.hidden = false
    }
    
    
    


}

