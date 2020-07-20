//
//  ViagensTableViewController.swift
//  MinhasViagens
//
//  Created by Roberto Martinelli Pinetti on 27/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class ViagensTableViewController: UITableViewController {
    
    private let segueVerLocal = "verLocal";
    var listaViagens: [Dictionary<String,String>] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.atualizarViagens();
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listaViagens.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath);
        let viagem = self.listaViagens[ indexPath.row ];
        
        cell.textLabel?.text = viagem["local"];

        return cell;
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ArmazenarDados().deletar(index: indexPath.row);
            self.atualizarViagens();
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        super.performSegue(withIdentifier: self.segueVerLocal, sender: indexPath.row );
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.segueVerLocal {
            let viewControllerDestino = segue.destination as! MapaViewController;
            
            if let index: Int = sender as? Int {
                viewControllerDestino.viagem = self.listaViagens[ index ];
            } else {
                viewControllerDestino.viagem = [:];
            }
            
        }
        
    }
    
    private func atualizarViagens( ) {
        self.listaViagens = ArmazenarDados().listar();
        super.tableView.reloadData();
    }
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
