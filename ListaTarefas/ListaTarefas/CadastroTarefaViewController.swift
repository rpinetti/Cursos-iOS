//
//  CadastroTarefaViewController.swift
//  ListaTarefas
//
//  Created by Roberto Martinelli Pinetti on 25/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class CadastroTarefaViewController: UIViewController {

    @IBOutlet weak var tarefaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AdicionarTarefa(_ sender: UIButton) {
        
        if let texto = self.tarefaTextField.text {
            
            let tarefa = TarefasUserDefault( );
            
            tarefa.salvar(tarefa: texto);
            self.tarefaTextField.text = "";
            
        } // if let texto
        
    }   // func AdicionarTarefa
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
