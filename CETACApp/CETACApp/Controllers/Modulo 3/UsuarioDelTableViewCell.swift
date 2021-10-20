//
//  UsuariosDelTableViewCell.swift
//  CETACApp
//
//  Created by Juan Díaz on 19/10/21.
//

import UIKit

class UsuarioDelTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var usuarioNNDel: UILabel!
    
    
    func update(with usuario:Usuario){
        usuarioNNDel.text = usuario.nombre
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
