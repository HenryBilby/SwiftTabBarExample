//
//  YellowViewController.swift
//  TabBarExample
//
//  Created by Henry Bilby on 17/09/21.
//

import UIKit

class YellowViewController: UIViewController {

    @IBOutlet weak var horaPickerView: UIPickerView!
    
    @IBOutlet weak var horaLabel: UILabel!
    
    var arrayHoras : [String] = []
    var arrayMinutos : [String] = []
    var arrayAMPM : [String] = ["AM","PM"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setArrayHoras()
        setArrayMinutos()
        
        horaPickerView.dataSource = self
        horaPickerView.delegate = self
    }
    
    
    @IBAction func selecionarButtonAction(_ sender: Any) {
        let horaFinal = getHoraDaPickerView()
        
        setHoraLabel(horaFinal: horaFinal)
    }
    
    private func setHoraLabel(horaFinal: String){
        horaLabel.text = horaFinal
    }
    
    private func getHoraDaPickerView() -> String {
        let indiceHoraSelecionada = horaPickerView.selectedRow(inComponent: 0)
        var indiceMinutoSelecionado = horaPickerView.selectedRow(inComponent: 1)
        let indiceAmPmSelecionado = horaPickerView.selectedRow(inComponent: 2)

        print ("Indice minuto selecionado: \(indiceMinutoSelecionado) resto da divisão: \(indiceMinutoSelecionado%arrayMinutos.count)")
        
        let hora = arrayHoras[indiceHoraSelecionada]
        
        if (indiceMinutoSelecionado >= self.arrayMinutos.count) {
            indiceMinutoSelecionado %= self.arrayMinutos.count
        }

        let minuto = arrayMinutos[indiceMinutoSelecionado]
        let amPm = arrayAMPM[indiceAmPmSelecionado]
        
        let horaFinal = String("\(hora) : \(minuto) \(amPm)")
        
        return horaFinal
    }
    
    private func setArrayHoras(){
        for i in 0...11{
            self.arrayHoras.append(String(i))
        }
    }
    
    private func setArrayMinutos(){
        for i in 0...59{
            if i < 10 {
                self.arrayMinutos.append(String("0\(i)"))
            } else {
                self.arrayMinutos.append(String(i))
            }
        }
    }
}

extension YellowViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 1 {

        }
    }
}

extension YellowViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
            case 0:
                return self.arrayHoras.count
            case 1:
                return 20*self.arrayMinutos.count
            case 2:
                return self.arrayAMPM.count
            default:
                return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
            case 0:
                return self.arrayHoras[row]
            case 1:
                return self.arrayMinutos[row % arrayMinutos.count]
            case 2:
                return self.arrayAMPM[row]
            default:
                return ""
        }
    }
    
}
