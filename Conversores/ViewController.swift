//
//  ViewController.swift
//  Conversores
//
//  Created by Heloisa Busquim on 21/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showNext(_ sender: UIButton) {
        switch lbUnit.text! {
        case "Temperatura":
            lbUnit.text = "Peso"
            btUnit1.setTitle("Quilograma", for: .normal)
            btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbUnit.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dólar", for: .normal)
        case "Moeda":
            lbUnit.text = "Distância"
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("Quilômetro", for: .normal)
        default:
            lbUnit.text = "Temperatura"
            btUnit1.setTitle("Celsius", for: .normal)
            btUnit2.setTitle("Fahrenheit", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            } else {
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
            }
        switch lbUnit.text {
            case "Temperatura":
               calcTemperature()
            case "Peso":
               calcWeight()
            case "Moeda":
              calcCurrency()
            default:
               calcDistance()
        }
        
        view.endEditing(true)
    }
    
    func calcTemperature() {
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Fahrenheit"
            lbResult.text = String(format: "%.2f", (temperature * 1.8) + 32.0)
        } else {
            lbResultUnit.text = "Celsius"
            lbResult.text = String(format: "%.2f", (temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight() {
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Libra"
            lbResult.text = String(format: "%.2f", weight * 2.20)
        } else {
            lbResultUnit.text = "Quilograma"
            lbResult.text = String(format: "%.2f", weight / 2.20)
        }

    }
    
    func calcCurrency() {
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Dólar"
            lbResult.text = String(format: "%.2f", currency * 5.38)
        } else {
            lbResultUnit.text = "Real"
            lbResult.text = String(format: "%.2f", currency / 5.38)
        }
        
    }
    
    func calcDistance() {
        guard let distance = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0 {
            lbResultUnit.text = "Quilômetro"
            lbResult.text = String(format: "%.2f", distance * 1000.0)
        } else {
            lbResultUnit.text = "Metro"
            lbResult.text = String(format: "%.2f", distance / 1000.0)
        }
        
    }
   
}

