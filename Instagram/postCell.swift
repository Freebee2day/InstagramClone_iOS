//
//  postCell.swift
//  Instagram
//
//  Created by Phoebe Zhong  on 4/8/21.
//  Copyright © 2021 Phoebe Zhong . All rights reserved.
//

import UIKit

class postCell: UITableViewCell {

    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var myPhotoIMG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
