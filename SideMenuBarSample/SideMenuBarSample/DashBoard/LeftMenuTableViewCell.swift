//
//  LeftMenuTableViewCell.swift
//  SideMenuBarSample
//
//  Created by RadhaKrishna Vajjha on 14/04/22.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var lblHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
