//
//  ViewController.swift
//  AlcoolGasolina
//
//  Created by Roberto Martinelli Pinetti on 31/12/18.
//  Copyright © 2018 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtAlcool: UITextField!
    @IBOutlet weak var txtGasolina: UITextField!
    @IBOutlet weak var lblResultado: UILabel!
    
    @IBAction func btnCalcular(_ sender: UIButton) {
        
        if let precoAlcool = txtAlcool.text {
            if let precoGasolina = txtGasolina.text {
                
                let validados = self.validarCampo(precoAlcool: precoAlcool, precoGasolina: precoGasolina);
                
                if validados {
                    self.lblResultado.text = self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina);
                } else {
                    self.lblResultado.text = "Informar o preço do Alcool e da Gasoina";
                }
                
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func calcularMelhorPreco(precoAlcool: String, precoGasolina: String) -> String {
        
        if let valorAlcool = Double(precoAlcool) {
            
            if let valorGasolina = Double(precoGasolina) {
                
                let resultado = valorAlcool / valorGasolina;
                
                if resultado >= 0.7 {
                    return "Melhor utilizar a gasolina!";
                } else {
                    return "Melhor utilizar a alcool!";
                }
                
            } else {
                return "Preço da Gasolina é inválido!";
            }
            
        } else {
            return "Preço do Alcool é inválido!";
        }
        
    }
    
    func validarCampo(precoAlcool: String, precoGasolina: String) -> Bool {
        
        var validados: Bool = false;
        
        if precoAlcool.isEmpty == false && precoGasolina.isEmpty == false {
            validados = true;
        }
        
        return validados;
        
    }

}

