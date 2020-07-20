//
//  ViewController.swift
//  CadastroProduto
//
//  Created by Roberto Martinelli Pinetti on 05/03/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var produtoDAO: ProdutoDAO = ProdutoDAO( );
    
    @IBOutlet weak var labelProduto: UILabel!
    @IBOutlet weak var textProduto: UITextField!
    @IBOutlet weak var textDescricao: UITextField!
    @IBOutlet weak var textPreco: UITextField!
    @IBOutlet weak var textCor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTextField();
        
        if self.textProduto.text != ""{
            self.labelProduto.text = self.textProduto.text;
            self.textProduto.isHidden = true;
            self.labelProduto.isHidden = false;
        } else {
            self.labelProduto.isHidden = true;
        }
        
    }
    
    @IBAction func botaoAdicionar(_ sender: UIButton) {
        
        if self.textProduto.text != "" &&
            self.textDescricao.text != "" &&
            self.textPreco.text != "" &&
            self.textCor.text != "" {
            
            let dao = ProdutoDAO( );
            
            dao.produto = self.textProduto.text!;
            dao.descricao = self.textDescricao.text!;
            dao.preco = Double(self.textPreco.text!)!;
            dao.cor = self.textCor.text!;
            
            CadastroProduto().gravar(produtoDAO: dao);
        } else {
            self.alertaMensagem(texto: "Preencher todos os campos!!");
        }
    }
    
    private func alertaMensagem(texto: String ) {
        
        let alertaController = UIAlertController(title: "Aviso", message: texto, preferredStyle: .alert);
        
        present(alertaController, animated: true, completion: nil);
    }

    private func setTextField( ) {
        if self.produtoDAO.produto != "" {
            self.textProduto.text = self.produtoDAO.produto;
            self.textDescricao.text = self.produtoDAO.descricao;
            self.textPreco.text = String(self.produtoDAO.preco);
            self.textCor.text = self.produtoDAO.cor;
        }
    }
    
}

