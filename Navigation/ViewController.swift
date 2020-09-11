//
//  ViewController.swift
//  Navigation
//
//  Created by sung hello on 2020/09/04.
//  Copyright © 2020 sung hello. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "abkhazia.png")
    let imgOff = UIImage(named: "afghanistan.png")
    
    var isOn = true
    
    
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController,isOn: Bool){
        if isOn {
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image=imgOff
            self.isOn = false
        }
    }
    
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txMessage: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image=imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let editViewController = segue.destination as! EditViewController
           if segue.identifier == "editButton"{
               editViewController.textWayValue="segue:use button"
           }else if segue.identifier == "editBarButton"{
               editViewController.textWayValue = "segue:use Bar button"
           }
        editViewController.textMessage = txMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
        
    }


}

