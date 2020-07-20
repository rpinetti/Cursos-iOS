//
//  ViewController.swift
//  MinhasAnotacoes
//
//  Created by Roberto Martinelli Pinetti on 24/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let forKey = "minhaAnotacao";
    
    @IBOutlet weak var anotacaoTextView: UITextView!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.anotacaoTextView.text = self.recuperarAnotacao();
    }

    @IBAction func SalvarButtom(_ sender: UIButton) {
        
        if let anotacao = self.anotacaoTextView.text {
            UserDefaults.standard.set(anotacao, forKey: self.forKey);
        }
        
    }
    
    /**
     * Esconde a barra de status
     **/
    override var prefersStatusBarHidden: Bool {
        return true;
    }
    
    /**
     * Esconde o teclado quando usuário clicar fora da caixa de texto
     **/
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("O usuário clicou fora");
        super.view.endEditing(true);
    }
    
    func recuperarAnotacao( ) -> String{
        
        if let texto = UserDefaults.standard.object(forKey: self.forKey) {
            return texto as! String;
        }
        
        return "";
        
    }
 
}

