
//  UsuariosTableViewCell.swift
//  CETACApp
//
//  Created by Juan Díaz on 19/10/21.
//

import UIKit

class UsuariosTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userNN: UILabel!
    
    
    func update(with usuario:Usuario){
        userNN.text = usuario.nombre
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
