//
//  OrangeViewController.swift
//  TabBarExample
//
//  Created by Henry Bilby on 17/09/21.
//

import UIKit

class OrangeViewController: UIViewController {

    @IBOutlet weak var op1TextField: UITextField!
    @IBOutlet weak var op2TextField: UITextField!
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func subtrairButtonAction(_ sender: Any) {
        if let val1 = Double(op1TextField.text ?? "0.0"){
            if let val2 = Double(op2TextField.text ?? "0.0") {
                let resultado = val1-val2
                resultadoLabel.text = String(resultado)
            }
        }
    }
    
}
