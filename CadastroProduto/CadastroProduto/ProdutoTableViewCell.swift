//
//  ProdutoTableViewCell.swift
//  CadastroProduto
//
//  Created by Roberto Martinelli Pinetti on 05/03/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit

class ProdutoTableViewCell: UITableViewCell {

    @IBOutlet weak var produto: UILabel!
    @IBOutlet weak var preco: UILabel!
    @IBOutlet weak var cor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
