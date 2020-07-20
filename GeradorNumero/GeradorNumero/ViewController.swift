//
//  ViewController.swift
//  GeradorNumero
//
//  Created by Roberto Martinelli Pinetti on 28/12/18.
//  Copyright © 2018 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumero: UILabel!
    
    @IBAction func btnGerarNumero(_ sender: UIButton) {
        
        var numero = arc4random_uniform(11)
        lblNumero.text = String(numero)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

