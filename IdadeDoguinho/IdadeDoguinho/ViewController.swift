//
//  ViewController.swift
//  IdadeDoguinho
//
//  Created by Roberto Martinelli Pinetti on 27/12/18.
//  Copyright © 2018 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblIdade: UILabel!
    
    @IBOutlet weak var txtIdade: UITextField!
    
    @IBAction func descobrirIdade(_ sender: UIButton) {
        
        let idade = Int(txtIdade.text!)! * 7;
        
        lblIdade.text = "A idade do doguinho é " + String(idade);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

