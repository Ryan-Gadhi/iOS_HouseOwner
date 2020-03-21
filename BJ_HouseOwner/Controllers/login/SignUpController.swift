//
//  SignUpController.swift
//  BJ_HouseOwner
//
//  Created by Project X on 3/17/20.
//  Copyright © 2020 beljomla.com. All rights reserved.
//

import Foundation
import UIKit


class SignUpController: UIViewController{
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstNameTextFeild: UITextField!
    @IBOutlet weak var lastNameTextFeild: UITextField!
    @IBAction func SignUpPressed(_ sender: UIButton) {
        self.navigationController?.navigationBar.isHidden = true
        performSegue(withIdentifier: "ToTabScreens", sender: self)
    }
    
    override func viewDidLoad() {
        styleUI()
    
        navigationItem.hidesBackButton = true
        
        print("please sign up")
    }
    
   
    func styleUI(){
        
    
        button.backgroundColor = UIColor(rgb: Colors.darkBlue)
        firstNameLabel.textColor = UIColor(rgb: Colors.darkBlue)
        
        lastNameLabel.textColor = UIColor(rgb: Colors.darkBlue)
        
        navigationController?.navigationBar.backgroundColor = UIColor(rgb: Colors.darkBlue)
        
        view.backgroundColor = UIColor(rgb: Colors.darkBlue)
        
        button.layer.cornerRadius = 10
        firstNameTextFeild.addBottomBorder()
        lastNameTextFeild.addBottomBorder()
        
        mainView.backgroundColor = UIColor(rgb: Colors.smokeWhite)
        
        firstNameTextFeild.backgroundColor = UIColor(rgb: Colors.smokeWhite)
        
        lastNameTextFeild.backgroundColor = UIColor(rgb: Colors.smokeWhite)
        
        let navBar = self.navigationController?.navigationBar
        
        
        
         mainView.layer.cornerRadius = 50
    }
}


extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height + 5, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
