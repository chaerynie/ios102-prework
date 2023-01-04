//
//  ViewController.swift
//  IntroduceStudent
//
//  Created by Lynn Kim on 1/3/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var colorSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var numPetsLabel: UILabel!
    @IBOutlet weak var numPetsStepper: UIStepper!
    @IBOutlet weak var morePetsSwitch: UISwitch!
        
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numPetsLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func colorSegmentDidChange(_ sender: UISegmentedControl) {
        let color = colorSegmentedControl.titleForSegment(at: colorSegmentedControl.selectedSegmentIndex)
        if color == "Yellow" {
            bgImage.image = UIImage(named:"YellowBackground")
        }
        else if color == "Pink" {
            bgImage.image = UIImage(named:"PinkBackground")
        }
        else if color == "Blue" {
            bgImage.image = UIImage(named:"BlueBackground")
        }
        else {
            bgImage.image = UIImage(named:"DefaultBackground")
        }
    }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
        let favColor = colorSegmentedControl.titleForSegment(at: colorSegmentedControl.selectedSegmentIndex)
        let numPets = numPetsLabel.text!
        
        // Favorite color
        var favColorStatement = ""
        if favColor == "None" {
            favColorStatement = "I don't have a favorite color"
        }
        else {
            favColorStatement = "My favorite color is \(favColor!.lowercased())"
        }
        
        // Number of pets owned
        var ownPetsStatement = ""
        if numPets == "1" {
            ownPetsStatement = "I own 1 pet"
        }
        else {
            ownPetsStatement = "I own \(numPets) pets"
        }
        
        // Want more pets
        var morePetsStatement = ""
        if morePetsSwitch.isOn {
            morePetsStatement = "I would like more pets!"
        }
        else {
            morePetsStatement = "I would not like more pets."
        }
        
        // Introduction
        let intro = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!.lowercased()) year of study. \(favColorStatement). \(ownPetsStatement), and \(morePetsStatement)"
        
        // Alert
        let alertController = UIAlertController(title: "My Introduction", message: intro, preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
                
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        morePetsSwitch.onTintColor = UIColor.black
    }

}

