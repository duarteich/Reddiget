//
//  EntryCell.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 08/04/21.
//

import UIKit

class EntryCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    //MARK: - Actions
    @IBAction func dismissPost(_ sender: UIButton) {
        
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
