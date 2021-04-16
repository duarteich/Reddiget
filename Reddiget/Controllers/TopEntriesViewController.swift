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
    private var entries = [Entry]()
    private var allEntriesLoaded = false
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    //MARK: - Actions
    
    @IBAction func dismissAll(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reddit Posts"
        setupTableView()
        viewModel.entries.bind { [weak self] entries in
            guard let self = self else { return }
            self.entries.append(contentsOf: entries)
            self.activityIndicatorView.stopAnimating()
            if !entries.isEmpty {
                self.tableView.isHidden = false
                self.tableView.reloadData()
            }
        }
        activityIndicatorView.startAnimating()
        viewModel.fetchTopEntries()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EntryCell.nib(), forCellReuseIdentifier: EntryCell.identifier)
        tableView.estimatedRowHeight = 180
        tableView.rowHeight = UITableView.automaticDimension
    }
}

//MARK: - UITableViewDataSource

extension TopEntriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if entries.count == viewModel.totalEntries {
            allEntriesLoaded = true
        }
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntryCell.identifier, for: indexPath) as? EntryCell else {
            fatalError("The dequeued cell is not an instance  of EntryCell")
        }

        let entryData = entries[indexPath.row].data
        cell.setup(with: entryData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if entries.count < viewModel.totalEntries {
            if indexPath.row == entries.count / 2 {
                viewModel.fetchTopEntries()
            }
        }
    }
}

//MARK: - UITableViewDelegate

extension TopEntriesViewController: UITableViewDelegate {
    
}


