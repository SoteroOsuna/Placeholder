//
//  SesionTableViewCell.swift
//  CETACApp
//
//  Created by Sotero Osuna on 16/10/21.
//

import UIKit

class SesionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var sesiones: UILabel!
    @IBOutlet weak var fecha: UILabel!
    @IBOutlet weak var tanatologo: UILabel!
    
    
    func update(with sesion: Sesion) {
        nombre.text = sesion.nombreUsuario
        sesiones.text = String(sesion.numeroSesion)
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "dd-MM-yyyy"
        fecha.text = formatter.string(from: Date(timeIntervalSince1970: sesion.fecha))
        tanatologo.text = sesion.nombreTanatologo
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
