//
//  ViewController.swift
//  Signos
//
//  Created by Roberto Martinelli Pinetti on 10/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var signos:[String] = [];
    var significados:[String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configura signos
        signos.append("Áries");
        signos.append("Touro");
        signos.append("Gêmeos");
        signos.append("Câncer");
        signos.append("Leão");
        signos.append("Virgem");
        signos.append("Libra");
        signos.append("Escorpião");
        signos.append("Sagitário");
        signos.append("Capricórnio");
        signos.append("Aquário");
        signos.append("Peixes");
        
        //configura significados
        significados.append("O ariano é uma pessoa cheia de energia e entusiasmo. Pioneiro e aventureiro, lhe encantam as metas, a liberdade e as idéias novas.")
        significados.append("Zeloso e possessivo, um cauro pode tender a ser inflexível e ressentido. As vezes os Touro pecam de ser cobiçosos e de permitir-se tudo.")
        significados.append("2 - ..");
        significados.append("3 - ..");
        significados.append("4 - ..");
        significados.append("5 - ..");
        significados.append("6 - ..");
        significados.append("7 - ..");
        significados.append("8 - ..");
        significados.append("9 - ..");
        significados.append("10 - ..");
        significados.append("11 - ..");
        significados.append("12 - ..");
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return signos.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso";
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath );
        celula.textLabel?.text = signos[ indexPath.row ];
        
        return celula;
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Desmarca a linha selecionada
        tableView.deselectRow(at: indexPath, animated: true);
        
        print( "Indice: " + String(indexPath.row) + " valor: " + signos[ indexPath.row ] );
        
        // Cria o pop-up de alerta
        let alertaController = UIAlertController(title: "Sginificado do Signo", message: significados[ indexPath.row ], preferredStyle: .alert);
        
        // Cria os botões no pop-up
        let acaoConfirmar = UIAlertAction(title: "ok?", style: .default, handler: nil);
        
        // Inclui a ação dos botões do pop-up
        alertaController.addAction(acaoConfirmar);
        
        // Exibe o pop-up
        present( alertaController, animated: true, completion: nil);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
         // Dispose of any resources that can be recreated.
    }
    
}

