//
//  TarefasUserDefault.swift
//  ListaTarefas
//
//  Created by Roberto Martinelli Pinetti on 25/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class TarefasUserDefault {
    
    private var listaTarefas: [String] = [];
    private let forKey: String = "listaTarefas";
    
    init( ) {
        self.listaTarefas = self.listar();
    }
    
    func remover(index: Int) {
        
        self.listaTarefas.remove(at: index);
        UserDefaults.standard.set(self.listaTarefas, forKey: self.forKey);
        
    }
    
    func salvar(tarefa: String ) {
        
        // Armazena a tarefa no array
        self.listaTarefas.append(tarefa);
        
        // Salvar tarefa
        UserDefaults.standard.set(self.listaTarefas, forKey: self.forKey);
        
    }   // func salvar
    
    func listar( ) -> Array<String> {
        
        if let lista = UserDefaults.standard.array(forKey: self.forKey) {
            return lista as! Array<String>;
        }
        
        return [];
        
    }   // func listar
    
}   // class TarefasUserDefault
