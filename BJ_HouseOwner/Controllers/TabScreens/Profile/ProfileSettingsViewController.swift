//
//  ProfileSettingsViewController.swift
//  BJ_HouseOwner
//
//  Created by Project X on 4/9/20.
//  Copyright © 2020 beljomla.com. All rights reserved.
//

import UIKit

class ProfileSettingsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    let switchableSettingsTitles: [String] = ["Be Logged", "Allow Delivery Person Calls"]
    let switchableSettingsBools:[Bool] = [true,true]
    
    let clickableSettings = ["👤 Sign Out", "Beljomla ©2020 Version 1.0"]
    let clickableSettingsBools:[Bool] = [true,false]
    let clickableSettingsFunctions:[((ProfileSettingsViewController)->()->())?] = [signUserOut,nil]
    
    let sectionNames = ["Profile", "General"]
    let sectionStartingTagNumber = 100
    
    
    func signUserOut() {
        FirebaseAuthStruct.signout(){
            success in
            if(success){
                self.okAlert(title: "Signed Out", message: "You have been successfully signed out, you may exit the app now.")
                // should pop to rootViewController
                
            }else{
                self.okAlert(title: "Error", message: "There has been an error siging you out")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("profile Settings")
        styleUI()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib1 = UINib(nibName: K.UITableCells.nibNames.clickableSettingsCell, bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: K.UITableCells.IDs.clickableSettingsCell)
        
        let nib2 = UINib(nibName: K.UITableCells.nibNames.switchSettingsCell, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: K.UITableCells.IDs.switchSettingsCell)
        
    }
    
    func styleUI() {
        let topInset = 30
        tableView.contentInset.top = CGFloat(topInset)
        
        //        tableView.layer.cornerRadius = tableView.layer.frame.width/10
    }
    
    
    
}


//MARK: -TableView

extension ProfileSettingsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return switchableSettingsTitles.count
        }else {
            return clickableSettings.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionNames[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            let myCell = cell as! SwitchSettingsTableViewCell
            myCell.label.text = switchableSettingsTitles[indexPath.row]
            myCell.theSwitch.isOn = switchableSettingsBools[indexPath.row]
            myCell.tag =  ( indexPath.section + 1 ) * (sectionStartingTagNumber + indexPath.row)
            
        }else{
            let myCell = cell as! ClickableSettingsTableViewCell
            myCell.label.text = clickableSettings[indexPath.row]
            myCell.tag =  ( indexPath.section + 1 ) * (sectionStartingTagNumber + indexPath.row)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            return tableView.dequeueReusableCell(withIdentifier: K.UITableCells.IDs.switchSettingsCell, for: indexPath)
        }else{
            return tableView.dequeueReusableCell(withIdentifier: K.UITableCells.IDs.clickableSettingsCell, for: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            // no click events for switches
        }else{
            if clickableSettingsBools[indexPath.row] {
                print("Clicked")
                if let storedfunc = clickableSettingsFunctions[indexPath.row]{
                    storedfunc(self)()
                }
            }
        }
    }
}
