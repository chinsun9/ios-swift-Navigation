//
//  EditViewController.swift
//  Navigation
//
//  Created by sung hello on 2020/09/04.
//  Copyright © 2020 sung hello. All rights reserved.
//

import UIKit


protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
}

class EditViewController: UIViewController {
    var textMessage: String = ""
    var textWayValue: String = ""
    var delegate: EditDelegate?
    var isOn = false
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var lblWay: UILabel!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textWayValue
        swIsOn.isOn=isOn
        
    }
    
   
    

    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn=true
        }
        else{
            isOn=false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
