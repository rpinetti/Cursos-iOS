//
//  DetalhesFilmeViewController.swift
//  meusFilmes
//
//  Created by Roberto Martinelli Pinetti on 24/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import Foundation;
import UIKit;

class DetalhesFilmeViewController: UIViewController {
    
    var filme: Filme!;
    
    @IBOutlet weak var filmeImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.filmeImageView.image = self.filme.imagem;
        self.tituloLabel.text = self.filme.titulo;
        self.descricaoLabel.text = self.filme.descricao;
        
    }
    
}
