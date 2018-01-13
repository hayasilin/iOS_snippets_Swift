//
//  SettingsViewController.swift
//  AllInOne
//
//  Created by Kuan-Wei Lin on 12/23/17.
//  Copyright © 2017 cracktheterm. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var menu: [String: [String]]!
    
    var keys = [String]()
    var items = [Array<String>]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationItem.title = "Settings"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")!
        menu = (NSDictionary(contentsOfFile: path) as! [String : [String]])
        
        if let dict = menu
        {
            keys = Array(dict.keys)
            
            for key in keys
            {
                let array = menu[key]
                items.append(array!)
            }
        }
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        configure(cell: cell, forItemAt: indexPath)
        
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath)
    {
        cell.selectionStyle = .none
        cell.textLabel?.text = items[indexPath.section][indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
        checkChosenCell(cellTitle: (cell?.textLabel?.text)!)
    }
    
    func checkChosenCell(cellTitle: String) {
        
        var nextVC = UIViewController()
        
        if cellTitle == "My Profile"
        {
            nextVC = ProfileViewController()
        }
        else if cellTitle == "My Favorites"
        {
            nextVC = FavoriteShopViewController()
        }
        else if cellTitle == "My Photos"
        {
            nextVC = ShopPhotoCollectionViewController()
        }
        else if cellTitle == "QRCode scan"
        {
            nextVC = QRCodeScanViewController()
        }
        else if cellTitle == "Control device"
        {
            nextVC = ControlDeviceViewController()
        }
        else if cellTitle == "Creator's Github"
        {
            nextVC = InstructionViewController()
        }
        else if cellTitle == "Contact me"
        {
            let to = "kuanwei.hayasi@gmail.com"
            let subject = "問題回報/意見反應"
            
            let mail = "mailto:\(to)?subject=\(subject)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            
            let url = URL(string: mail!)
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        else if cellTitle == "Log out"
        {
            if Auth.auth().currentUser != nil
            {
                do {
                    try Auth.auth().signOut()
                }
                catch let error as NSError
                {
                    print(error.localizedDescription)
                }
            }
        }
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
