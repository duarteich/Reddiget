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
    
    //MARK: - Properties
    static let identifier = "EntryCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setup(with entryData: EntryData?) {
        if let entryData = entryData {
            thumbnailImageView.setImage(url: entryData.thumbnail, placeholderImage: #imageLiteral(resourceName: "placeholderImage"))
            autorLabel.text = entryData.author
            createdLabel.text = createdDateText(from: entryData.created)
            titleLabel.text = entryData.title
            commentsLabel.text =  entryData.numComments > 1 ? "\(entryData.numComments) comments" : "\(entryData.numComments) comment"
        } else {
            autorLabel.alpha = 0
            createdLabel.alpha = 0
            titleLabel.alpha = 0
            commentsLabel.alpha = 0
        }
    }
    
    func createdDateText(from timeInterval: TimeInterval) -> String {
        let date = Date.init(timeIntervalSince1970: timeInterval)
        let diffComponents = Calendar.current.dateComponents([.hour], from: date, to: Date())
        guard let hours = diffComponents.hour else { return "" }
        return hours > 1 ? "\(hours) hours ago" : "\(hours) hour ago"
    }
}
