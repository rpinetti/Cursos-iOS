//
//  ArmazenarDados.swift
//  MinhasViagens
//
//  Created by Roberto Martinelli Pinetti on 27/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import Foundation
import UIKit

class ArmazenarDados{
    
    private let forKey: String = "locaisViagens";
    private var viagens: [ Dictionary<String, String> ] = [];
    
    private func getDefault( ) -> UserDefaults {
        return UserDefaults.standard;
    }
    
    func gravar( viagem: Dictionary<String, String> ) {
        
        self.viagens = self.listar();
        self.viagens.append(viagem);
        self.setUserDefault();
        
        print(self.viagens);
    }
    
    func listar( ) -> [ Dictionary<String, String> ] {
        
        let dados = self.getDefault().object(forKey: self.forKey);
        
        if (dados != nil) {
            return dados as! Array;
        } else {
            return [];
        }
    }
    
    func deletar( index: Int ) {
        
        self.viagens = self.listar();
        self.viagens.remove(at: index);
        self.setUserDefault();
    }
    
    private func setUserDefault( ) {
        self.getDefault().set(self.viagens, forKey: self.forKey);
        self.getDefault().synchronize();
    }
    
}   // class ArmazenarDados
