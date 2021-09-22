//
//  ViewController.swift
//  TabBarExample
//
//  Created by Henry Bilby on 17/09/21.
//

import UIKit

//ViewController é responsável por exibição de elementos da UI, no futuro vamos separar em camadas
class ViewController: UIViewController {

    @IBOutlet weak var op1TextField: UITextField!
    @IBOutlet weak var op2TextField: UITextField!
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    let calculadora: Calculadora = Calculadora()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func somarButtonAction(_ sender: Any) {
        realizaSomaEntreTextFields(op1TextField, op2TextField)
    }
    
    private func realizaSomaEntreTextFields(_ textFieldA: UITextField, _ textFieldB: UITextField){
        if ehValido(textField: textFieldA) && ehValido(textField: textFieldB) {
            let valor1 = converteStringParaNumero(string: textFieldA.text)
            let valor2 = converteStringParaNumero(string: textFieldB.text)
            
            let resultado = calculadora.soma(valorA: valor1, valorB: valor2)
            
            self.resultadoLabel.text = "\(resultado)"
        }
    }
    
    private func converteStringParaNumero(string: String?) -> Double {
        guard let string = string, let numero = Double(string) else {return 0.0}
        return numero
    }
    
    private func ehValido(textField : UITextField) -> Bool {
        guard let valor = textField.text, let _ = Double(valor) else {
            adicionaModeloErroA(textField: textField)
            return false
        }
        
        removeModeloErroSeNecessario(textField: textField)
        return true
    }
    
    private func adicionaModeloErroA(textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
    }
    
    private func removeModeloErroSeNecessario(textField: UITextField){
        if textField.layer.borderColor == UIColor.red.cgColor {
            textField.layer.borderColor = UIColor.white.cgColor
        }
    }    
}

