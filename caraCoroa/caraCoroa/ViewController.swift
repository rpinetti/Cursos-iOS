//
//  ViewController.swift
//  caraCoroa
//
//  Created by Roberto Martinelli Pinetti on 10/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "jogarMoeda" {
            
            let vcDestino = segue.destination as! DetalhesViewController;
            vcDestino.numeroRandomico = Int(arc4random_uniform(2));
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }


}

