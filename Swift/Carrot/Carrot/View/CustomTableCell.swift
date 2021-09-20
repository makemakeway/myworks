//
//  CustomTableCell.swift
//  Carrot
//
//  Created by 박연배 on 2021/09/08.
//

import UIKit

class CustomTableCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var heartImage: UIImageView?
    @IBOutlet weak var likes: UILabel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
