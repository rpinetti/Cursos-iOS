//
//  ViewController.swift
//  passandoDados
//
//  Created by Roberto Martinelli Pinetti on 10/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTexto: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "enviarDados" {
            let vcDestino = segue.destination as! DetalhesViewController;
            vcDestino.textRecebido = txtTexto.text!;
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

