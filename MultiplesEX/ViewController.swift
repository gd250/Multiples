//
//  ViewController.swift
//  MultiplesEX
//
//  Created by Roy Morisi on 06/07/2016.
//  Copyright © 2016 RoyMorisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    //Propeties
    var maxNumber = 100
    var userInput = 0  //User's input from TF
    var result = 0  //the result of the increment
    var  counter = 0 // counter for result
    
    
    //IBOutlets
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var playBTN: UIButton!
    @IBOutlet weak var whatMultipleToAddTF: UITextField!
    @IBOutlet weak var addBTN: UIButton!
    @IBOutlet weak var resultLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    override func  preferredStatusBarStyle() -> UIStatusBarStyle {
        
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func playBTNPressedAction(sender: AnyObject)
    {
        if whatMultipleToAddTF.text != nil && whatMultipleToAddTF.text != ""
        {
            hideTheStartGameViewsOnTheScreen()
            userInput = Int(whatMultipleToAddTF.text!)!
            resultLBL.hidden = false
            resultLBL.text = "Press Add To Add"

        }
        else  //user's input is emtpy
        {
            let alert = UIAlertController(title: nil, message: "Please enter a number", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    @IBAction func addBtnPressedAction(sender: AnyObject)
    {
        if (counter == 0)
        {
            result = 0 + userInput
            resultLBL.text = "0 + " + "\(userInput) = " + "\(result)"
            
        }
        
        else
        {
            result = result + userInput
            resultLBL.text = "\(result) +" + "\(userInput) = " + "\(result+userInput)"

        }
        
        if isGameOver()
        {
            restartGame()
        }
        
        counter += 1
    }
    
    
    
    
    // dismiss the keyboard
    func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func restartGame()
    {
        userInput = 0
        counter = 0
        result = 0
        showTheStartGameViewsOnTheScreen()
        whatMultipleToAddTF.text = ""

    }
    
    func isGameOver() ->Bool
    {
        if result >= maxNumber
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func hideTheStartGameViewsOnTheScreen ()
    {
        whatMultipleToAddTF.hidden = true
        playBTN.hidden = true
        logo.hidden = true
        
        
        addBTN.hidden = false
        resultLBL.hidden = false
    }
    func showTheStartGameViewsOnTheScreen ()
    {
        whatMultipleToAddTF.hidden = false
        playBTN.hidden = false
        logo.hidden = false
        
        
        addBTN.hidden = true
        resultLBL.hidden = true
    }
}



