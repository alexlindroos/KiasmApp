//
//  TableViewCell.swift
//  Kiasmapp
//
//  Created by Juhani Lavonen on 26.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    @IBOutlet weak var productArtist: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productInfo: UITextView!
    @IBOutlet weak var webView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
