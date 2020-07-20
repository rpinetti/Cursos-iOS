//
//  ProdutoDAO.swift
//  CadastroProduto
//
//  Created by Roberto Martinelli Pinetti on 05/03/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import Foundation

class ProdutoDAO {
    
    public var produto: String;
    public var descricao: String;
    public var cor: String;
    public var preco: Double;
    
    init( ) {
        self.produto = "";
        self.descricao = "";
        self.cor = "";
        self.preco = 0.0;
    }
    
}
