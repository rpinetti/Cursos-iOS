//
//  TarefasTableViewController.swift
//  ListaTarefas
//
//  Created by Roberto Martinelli Pinetti on 25/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {

    var tarefas: [String] = [];
    
    /**
     * Chamado apenas na 1 vez
     **/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    /**
     * Chamado quando a tela for chamada
     **/
    override func viewDidAppear(_ animated: Bool) {
        self.atualizarLista();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    func atualizarLista( ) {
        let tarefa = TarefasUserDefault( );
        self.tarefas = tarefa.listar();
        
        super.tableView.reloadData();
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let tarefaUD = TarefasUserDefault( );
            tarefaUD.remover(index: indexPath.row);
            self.atualizarLista();
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tarefas.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath);

        cell.textLabel?.text = tarefas[ indexPath.row ];

        return cell;
        
    }
 

}
