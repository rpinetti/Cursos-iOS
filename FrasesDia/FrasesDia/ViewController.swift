//
//  ViewController.swift
//  FrasesDia
//
//  Created by Roberto Martinelli Pinetti on 28/12/18.
//  Copyright © 2018 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblFrase: UILabel!
    
    @IBAction func btnFrase(_ sender: UIButton) {
        var frases: [String] = []
        
        frases.append("A grandeza vem não quando as coisas sempre vão bem para você, mas a grandeza vem quando você é realmente testado, quando você sofre alguns golpes, algumas decepções, quando a tristeza chega. Porque apenas se você esteve nos mais profundos vales você poderá um dia saber o quão magnífico é se estar no topo da mais alta montanha.")
        
        frases.append("O segredo para ser feliz é aceitar o lugar onde você está hoje na vida, e dar o melhor de si todos os dias.")
        
        frases.append("Cada vez que você é honesto e conduz a si próprio com honestidade, uma força de prosperidade impulsionará você em direção a um grande sucesso. Cada vez que você mente, mesmo uma pequena mentira inofensiva, existem fortes forças empurrando você em direção ao fracasso.")
        
        frases.append("Nunca mude seu jeito de ser pra satisfazer as pessoas que você gosta. Pois quem gosta de você não te muda e sim te completa.")
        
        let numero = arc4random_uniform( UInt32(frases.count) )
        lblFrase.text = frases[ Int(numero) ]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

