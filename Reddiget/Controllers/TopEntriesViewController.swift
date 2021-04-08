//
//  ViewController.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 06/04/21.
//

import UIKit

class TopEntriesViewController: UIViewController {
    
    private let viewModel = TopEntriesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchTopEntries()
    }


}

