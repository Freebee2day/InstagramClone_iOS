//
//  SinglePostTableViewCell.swift
//  Instagram
//
//  Created by Phoebe Zhong  on 4/7/21.
//  Copyright © 2021 Phoebe Zhong . All rights reserved.
//

import UIKit

class SinglePostTableViewCell: UITableViewCell {

    @IBOutlet weak var feedIMG: UIImageView!
    @IBOutlet weak var feedAuthor: UILabel!
    @IBOutlet weak var feedCaption: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
