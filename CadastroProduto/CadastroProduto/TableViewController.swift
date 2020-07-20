//
//  TableViewController.swift
//  CadastroProduto
//
//  Created by Roberto Martinelli Pinetti on 05/03/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let segueProduto = "adicionarProduto";
    private var produtos: [ProdutoDAO] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    private func atualizarProdutos( ){
        self.produtos = CadastroProduto().listarTudo();
        super.tableView.reloadData();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.atualizarProdutos();
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.produtos.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! ProdutoTableViewCell;

        let produto : ProdutoDAO = self.produtos[ indexPath.row ];
        
        cell.produto.text = produto.produto;
        cell.preco.text = String(produto.preco);
        cell.cor.text = produto.cor;
        
        return cell;
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let produto = self.produtos[ indexPath.row ];
            CadastroProduto().remover(produto: produto);
            self.atualizarProdutos();
        } else if editingStyle == .insert {
            
        }    
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let produto = self.produtos[ indexPath.row ];
        
        print( "Linha selecionada: " + String(indexPath.row) + " produto " + produto.produto );
        
        super.performSegue(withIdentifier: self.segueProduto, sender: produto );
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detalheViewController = segue.destination as? ViewController,
            let index = super.tableView.indexPathForSelectedRow?.row
            else {
                return;
        }
        
        detalheViewController.produtoDAO = self.produtos[ index ];
    }
    
}
