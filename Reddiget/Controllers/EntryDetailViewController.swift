//
//  EntryDetailViewController.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 16/04/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - Computed Properties
    var entry: Entry? {
        didSet{
            refreshUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func refreshUI() {
        if let entryData = entry?.data {
            loadViewIfNeeded()
            authorLabel.isHidden = false
            authorLabel.text = entryData.author
            titleLabel.isHidden = false
            titleLabel.text = entryData.title
            imageView.isHidden = false
        }
    }
}

//MARK: - EntrySelectionDelegate

extension EntryDetailViewController: EntrySelectionDelegate {
    
    func entrySelected(_ newEntry: Entry) {
        entry = newEntry
    }
}
