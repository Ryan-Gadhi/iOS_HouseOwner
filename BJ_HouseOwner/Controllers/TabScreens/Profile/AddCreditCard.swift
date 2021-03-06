//
//  AddCreditCard.swift
//  BJ_HouseOwner
//
//  Created by Project X on 5/5/20.
//  Copyright © 2020 beljomla.com. All rights reserved.
//

import Foundation
import UIKit

class AddCreditCard: UIViewController{
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var cardView: UIStackView!

    @IBAction func savePressed(_ sender: UIButton) {
        okAlert("Not currently implemented", " Please wait for future updates"){
            
        }
    }
    
    @IBOutlet weak var madaButton: UIButton!
    @IBOutlet weak var madaImageRapper: UIView!
    @IBOutlet weak var masterCardButton: UIButton!
    @IBOutlet weak var masterCardImageRapper: UIView!
    @IBOutlet weak var visaButton: UIButton!
    @IBOutlet weak var visaImageRapper: UIView!
    @IBOutlet weak var cardHolderField: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var cvvField: UITextField!
    @IBOutlet weak var cvvButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var checkBoxRappers:[UIView] = []
    var checkBoxes:[UIButton] = []
    
    var checkedBoxes = [false,false,false]
    var firstTimers = [false,false,false]
    
    
    override func viewDidLoad() {
        madaButton.isSelected = true
        
        cardView.isHidden = true
        styleUI()
        self.hideKeyboardWhenTappedAround()
    }
    func styleUI(){
        
        func cornerRadius(button: UIButton, rapperView:UIView ){
            button.layer.cornerRadius = button.frame.width/2
            rapperView.layer.cornerRadius = rapperView.frame.width/2
        }
        func cornerRadius(view: UIView ){
            view.layer.cornerRadius = view.frame.width/2
        }
        func colorCheckBox(button:UIButton, rapperView:UIView){
            button.backgroundColor = UIColor(rgb: Colors.smokeWhite)
            rapperView.backgroundColor = UIColor(rgb: Colors.smokeWhite)
            rapperView.layer.borderWidth = 1
            //            rapperView.layer.borderColor = UIColor(rgb: Colors.smokeWhite) as! CGColor //
        }
        func makeButtonACheckBox(button: UIButton, rapperView:UIView ){
            cornerRadius(button: button,rapperView: rapperView)
            colorCheckBox(button: button,rapperView: rapperView)
        }
        
        navigationController?.navigationBar.barTintColor = UIColor(rgb: Colors.darkBlue)
        
        saveButton.backgroundColor = UIColor(rgb: Colors.darkBlue)
        
        
        checkBoxRappers = [madaImageRapper,masterCardImageRapper,visaImageRapper]
        checkBoxes = [madaButton,masterCardButton,visaButton]
        
        view.backgroundColor = UIColor(rgb: Colors.smokeWhite)
        
        makeButtonACheckBox(button: madaButton, rapperView: madaImageRapper)
        makeButtonACheckBox(button: masterCardButton, rapperView: masterCardImageRapper)
        makeButtonACheckBox(button: visaButton, rapperView: visaImageRapper)
        
        cardHolderField.addBottomBorder()
        cardNumber.addBottomBorder()
        cvvField.addBottomBorder()
        
        cornerRadius(view: cvvButton)
        cvvButton.backgroundColor = UIColor(rgb: Colors.darkBlue)
        
        monthField.layer.borderWidth =  1
        monthField.layer.cornerRadius = monthField.frame.width/7
        monthField.backgroundColor = UIColor(rgb: Colors.smokeWhite)
        
        saveButton.layer.cornerRadius = saveButton.frame.width/25
        
        yearField.layer.borderWidth = 1
        yearField.layer.cornerRadius = yearField.frame.width/7
        yearField.backgroundColor = UIColor(rgb: Colors.smokeWhite)
        
    }
    
    @IBAction func buttonChecked(_ sender: UIButton) {
        
        func showView(view: UIView, hidden: Bool) {
            UIView.transition(with: view, duration: 0.7, options: .transitionCrossDissolve, animations: {
                view.isHidden = hidden
            })
        }
        
        func makeItChecked(_ button: UIButton, _ buttonRapper:UIView){
            
            print("selected")
            
            button.setBackgroundImage(#imageLiteral(resourceName: "checkmark"), for: .normal)
            button.backgroundColor = UIColor(rgb: Colors.darkBlue)
            buttonRapper.backgroundColor = UIColor(rgb: Colors.darkBlue)
            
            buttonRapper.layer.borderWidth = 0
        }
        
        func makeItUnchecked(_ button: UIButton,_ buttonRapper:UIView){
            print("not selected")
            
            button.setBackgroundImage(nil, for: .normal)
            
            button.backgroundColor = UIColor(rgb: Colors.smokeWhite)
            
            button.backgroundColor = UIColor(rgb: Colors.smokeWhite)
            
            buttonRapper.backgroundColor = UIColor(rgb: Colors.smokeWhite)
            
            buttonRapper.layer.borderWidth = 1
            
        }
        
        sender.isSelected = true
        
        // this is needed for the first time only
        if (!firstTimers[sender.tag]){
            sender.isSelected = true
            firstTimers[sender.tag] = true
            
        }
        
        for i in 0...checkedBoxes.count-1{
            //checkedBoxes[i] = false
            makeItUnchecked(checkBoxes[i], checkBoxRappers[i])
            
        }
        makeItChecked(checkBoxes[sender.tag],checkBoxRappers[sender.tag])
        //checkedBoxes[sender.tag] = true
        
        
        if sender.tag == 0{
            //cardView.isHidden = true
            showView(view: cardView, hidden: false) // this was true when it was cash
            
            
        }else if sender.tag == 1{
            print("Mada")
            //cardView.isHidden = false
            showView(view: cardView, hidden: false)
            
        } else if sender.tag == 2{
            print("MasterCard")
            //cardView.isHidden = false
            showView(view: cardView, hidden: false)
            
            
        }else if sender.tag == 3{
            print("Visa")
            //cardView.isHidden = false
            showView(view: cardView, hidden: false)
            
        }else{
            print("error")
            cardView.isHidden = false
        }
    }
    
}
