//
//  Filme.swift
//  meusFilmes
//
//  Created by Roberto Martinelli Pinetti on 24/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import Foundation;
import UIKit;

class Filme {
    
    var titulo: String!;
    var descricao: String!;
    var imagem: UIImage!;
    
    init(titulo: String, descricao: String, imagem: UIImage){
        self.titulo = titulo;
        self.descricao = descricao;
        self.imagem = imagem;
    }
    
}
