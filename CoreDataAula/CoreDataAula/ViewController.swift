//
//  ViewController.swift
//  CoreDataAula
//
//  Created by Roberto Martinelli Pinetti on 28/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario");
        
        do{
            let usuarios = try context.fetch(request);
            
            if usuarios.count > 0 {
                
                for usuario in usuarios as! [NSManagedObject]{
                    let nome = usuario.value(forKey: "nome") as! String;
                    let idade = usuario.value(forKey: "idade") as! Int;
                    let login = usuario.value(forKey: "login") as! String;
                    let senha = usuario.value(forKey: "senha") as! String;
                    
                    print("nome do usuário: " + nome);
                }
                
            } else {
                print("Nenhum usuário encontrado");
            }
            
        }catch{
            
        }
        
        /*
        // Cria a entidade
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context);
        
        // Inclui um registro
        usuario.setValue("Roberto Pinetti", forKey: "nome");
        usuario.setValue(31, forKey: "idade");
        usuario.setValue("rpinetti", forKey: "login");
        usuario.setValue("1234", forKey: "senha");
        
        //Persistir os dados
        do{
            try context.save();
            print("Usuário incluído");
        }catch{
            print("erro ao incluir o usuário");
        }
        */
        
    }


}

