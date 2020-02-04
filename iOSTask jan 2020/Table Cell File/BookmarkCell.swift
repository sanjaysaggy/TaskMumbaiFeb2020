//
//  BookmarkCell.swift
//  iOS Interview Task
//
//  Created by MONU on 1/15/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//


import UIKit

class BookmarkCell: UITableViewCell {

    
    @IBOutlet weak var movie_IMG: UIImageView!
    @IBOutlet weak var movie_Nam: UILabel!
    @IBOutlet weak var movie_Date: UILabel!
    @IBOutlet weak var popularity_Lbl: UILabel!
    @IBOutlet weak var movie_Description: UILabel!
    @IBOutlet weak var cell_BTN: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
