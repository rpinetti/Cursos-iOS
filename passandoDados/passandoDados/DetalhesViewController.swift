//
//  DetalhesViewController.swift
//  passandoDados
//
//  Created by Roberto Martinelli Pinetti on 10/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {

    @IBOutlet weak var lblResultado: UILabel!
    var textRecebido: String = "0";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblResultado.text = textRecebido;
        
        // Do any additional setup after loading the view.
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
