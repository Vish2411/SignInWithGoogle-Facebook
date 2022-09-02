//
//  TableViewCell1.swift
//  pageControllerAppDemo
//
//  Created by iMac on 04/08/22.
//

import UIKit

class TableViewCell1: UITableViewCell {

    @IBOutlet weak var lblTableView1: UILabel!
    @IBOutlet weak var checkBox: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
