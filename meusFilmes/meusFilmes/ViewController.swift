//
//  ViewController.swift
//  meusFilmes
//
//  Created by Roberto Martinelli Pinetti on 24/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UITableViewController{
    
    let segueDetalheFilme = "detalheFilme";
    
    var filmes: [Filme] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var filme: Filme;
        
        filme = Filme(titulo: "007 - Spectre", descricao: "descrição 1", imagem: UIImage(named: "filme1")!);
        filmes.append(filme);
        filme = Filme(titulo: "Star Wars", descricao: "descrição 2", imagem: UIImage(named: "filme2")!);
        filmes.append(filme);
        filme = Filme(titulo: "Impacto Mortal", descricao: "descrição 3", imagem: UIImage(named: "filme3")!);
        filmes.append(filme);
        filme = Filme(titulo: "Deadpool", descricao: "descrição 4", imagem: UIImage(named: "filme4")!);
        filmes.append(filme);
        filme = Filme(titulo: "O Regresso", descricao: "descrição 5", imagem: UIImage(named: "filme5")!);
        filmes.append(filme);
        filme = Filme(titulo: "A Herdeira", descricao: "descrição 6", imagem: UIImage(named: "filme6")!);
        filmes.append(filme);
        filme = Filme(titulo: "Caçadores de Emoção", descricao: "descrição 7", imagem: UIImage(named: "filme7")!);
        filmes.append(filme);
        filme = Filme(titulo: "Regresso do Mal", descricao: "descrição 8", imagem: UIImage(named: "filme8")!);
        filmes.append(filme);
        filme = Filme(titulo: "Tarzan", descricao: "descrição 9", imagem: UIImage(named: "filme9")!);
        filmes.append(filme);
        filme = Filme(titulo: "Hardcore", descricao: "descrição 10", imagem: UIImage(named: "filme10")!);
        filmes.append(filme);
        
    }   // func viewDidLoad
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }   // func numberOfSections
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filmes.count;
    }   // func tableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celulaReuso = "celulaReuso";
        
        let filme: Filme = self.filmes[ indexPath.row ];
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! FilmeCelula;
        celula.tituloLabel?.text = filme.titulo;
        celula.descricaoLabel?.text = filme.descricao;
        celula.filmeImageView?.image = filme.imagem;
        
        /*
        celula.filmeImageView.layer.cornerRadius = 42;
        celula.filmeImageView.clipsToBounds = true;
        */
        
        return celula;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == self.segueDetalheFilme {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let filmeSelecionado = self.filmes[ indexPath.row ];
                let viewControllerDestino = segue.destination as! DetalhesFilmeViewController;
                viewControllerDestino.filme = filmeSelecionado;
                
            }   // if let indexPath
            
        }   // if segue.identifier
        
    }   // func prepare
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }   // func didReceiveMemoryWarning
    
}   // class ViewController

