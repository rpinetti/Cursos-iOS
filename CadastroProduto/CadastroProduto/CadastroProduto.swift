//
//  CadastroProduto.swift
//  CadastroProduto
//
//  Created by Roberto Martinelli Pinetti on 05/03/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CadastroProduto {
    
    private let entityName: String = "Produtos";
    
    private func getContext( ) -> NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate;
        let context = appDelegate.persistentContainer.viewContext;
        
        return context;
        
    }
    
    private func getRequest( ) -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: self.entityName);
    }
    
    private func getEntity(context: NSManagedObjectContext ) -> NSManagedObject {
        return NSEntityDescription.insertNewObject(forEntityName: self.entityName, into: context);
    }
    
    public func gravar( produtoDAO: ProdutoDAO ) {
        
        // Cria a entidade
        let context = self.getContext();
        let request = self.getRequest();
        
        // Verificar se o produto existe
        let produtos = self.filtroProdutoByNome(nomeProduto: produtoDAO.produto, context: context, request: request);
        
        if produtos.count == 1 {
            self.atualizar(produtoDAO: produtoDAO, context: context, entity: produtos[0]);
        } else {
            self.incluir(produtoDAO: produtoDAO, context: context);
        }
        
    }
    
    public func listarTudo( ) -> [ProdutoDAO] {
        
        var listaProduto: [ProdutoDAO] = [];
        
        // Cria a entidade
        let context = self.getContext();
        let request = self.getRequest();
        
        // Ordena os dados
        let ordenacaoAZ = NSSortDescriptor(key: "produto", ascending: true);
        request.sortDescriptors = [ordenacaoAZ];
        
        do{
            let produtos = try context.fetch(request);
            
            if produtos.count > 0 {
                
                for produto in produtos as! [NSManagedObject]{
                    
                    let dao: ProdutoDAO = ProdutoDAO( );
                    
                    dao.produto = produto.value(forKey: "produto") as! String;
                    dao.descricao = produto.value(forKey: "descricao") as! String;
                    dao.preco = produto.value(forKey: "preco") as! Double;
                    dao.cor = produto.value(forKey: "cor") as! String;
                    
                    listaProduto.append(dao);
                    print("produto: " + dao.produto);
                    
                }
                
            } else {
                print("Nenhum produto encontrado!!");
            }
            
        }catch{
            
        }
        
        return listaProduto;
    }
    
    public func filtroProduto( nomeProduto: String ) -> [ProdutoDAO] {
        
        // Cria a entidade
        let context = self.getContext();
        let request = self.getRequest();
        
        var listaProduto: [ProdutoDAO] = [];
        let produtos = self.filtroProdutoByNome(nomeProduto: nomeProduto, context: context, request: request);
        
        if produtos.count > 0 {
            
            for produto in produtos {
                
                let dao: ProdutoDAO = ProdutoDAO( );
                
                dao.produto = produto.value(forKey: "produto") as! String;
                dao.descricao = produto.value(forKey: "descricao") as! String;
                dao.preco = produto.value(forKey: "preco") as! Double;
                dao.cor = produto.value(forKey: "cor") as! String;
                
                listaProduto.append(dao);
                print("produto: " + dao.produto);
                
            }
            
        }
        
        return listaProduto;
    }
    
    private func incluir( produtoDAO: ProdutoDAO, context: NSManagedObjectContext ) {
        
        // Cria a entidade
        let entity = self.getEntity( context: context );
        
        // Inclui um registro
        entity.setValue(produtoDAO.produto, forKey: "produto");
        entity.setValue(produtoDAO.descricao, forKey: "descricao");
        entity.setValue(produtoDAO.preco, forKey: "preco");
        entity.setValue(produtoDAO.cor , forKey: "cor");
        
        //Persistir os dados
        do{
            try context.save();
            print("Produto Gravado");
        }catch{
            print("erro ao incluir o produto");
        }
        
    }
    
    private func atualizar( produtoDAO: ProdutoDAO, context: NSManagedObjectContext, entity: NSManagedObject ) {
        
        // Inclui um registro
        entity.setValue(produtoDAO.descricao, forKey: "descricao");
        entity.setValue(produtoDAO.preco, forKey: "preco");
        entity.setValue(produtoDAO.cor , forKey: "cor");
        
        //Persistir os dados
        do{
            try context.save();
            print("Produto Gravado");
        }catch{
            print("erro ao incluir o produto");
        }
        
    }
    
    private func filtroProdutoByNome( nomeProduto: String, context: NSManagedObjectContext, request: NSFetchRequest<NSFetchRequestResult> ) -> [NSManagedObject]{
        
        // Ordena os dados
        let ordenacaoAZ = NSSortDescriptor(key: "produto", ascending: true);
        request.sortDescriptors = [ordenacaoAZ];
        
        // Aplicar filtro
        // let predicate = NSPredicate(format: "produto == %@", nomeProduto);
        let predicate = NSPredicate(format: "produto contains [c] %@", nomeProduto);
        request.predicate = predicate;
        
        do{
            let produtos = try context.fetch(request);
            
            if produtos.count > 0 {
                return produtos as! [NSManagedObject];
            } else {
                print("Nenhum produto encontrado!!");
            }
            
        }catch{
            fatalError("erro ao acessar a entidade: " + self.entityName);
        }
        
        return [];
    }
    
    public func remover( produto: ProdutoDAO ) {
        
        // Cria a entidade
        let context = self.getContext();
        let request = self.getRequest();
        
        let produtos = self.filtroProdutoByNome(nomeProduto: produto.produto, context: context, request: request);
        let entity = produtos[0];
        
        do{
            try context.delete( entity );
        }catch{
            fatalError("erro ao eliminar o registro na entidade: " + self.entityName);
        }
        
    }
    
}   // class CadastroProduto
