//
//  ViewController.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 06/04/21.
//

import UIKit

class TopEntriesViewController: UIViewController {
    
    //MARK: - private properties
    
    private let viewModel = TopEntriesViewModel()
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Actions
    
    @IBAction func dismissAll(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchTopEntries()
    }
}

//MARK: - UITableViewDataSource

extension TopEntriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

//MARK: - UITableViewDelegate

extension TopEntriesViewController: UITableViewDelegate {
    
}

