//
//  ViewController.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 06/04/21.
//

import UIKit

protocol EntrySelectionDelegate: class {
    func entrySelected(_ entry: Entry)
}

class TopEntriesViewController: UITableViewController {
    
    //MARK: - private properties
    
    private let viewModel = TopEntriesViewModel()
    private var entries = [Entry]()
    private var allEntriesLoaded = false
    
    //MARK: - delegates
    weak var delegate: EntrySelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reddit Posts"
        setupTableView()
        viewModel.entries.bind { [weak self] entries in
            guard let self = self else { return }
            self.entries.append(contentsOf: entries)
            if !entries.isEmpty {
                self.tableView.reloadData()
                self.tableView.isHidden = false
            }
        }
        viewModel.fetchTopEntries()
    }
    
    private func setupTableView() {
        tableView.register(EntryCell.nib(), forCellReuseIdentifier: EntryCell.identifier)
        tableView.estimatedRowHeight = 180
        tableView.rowHeight = UITableView.automaticDimension
    }

    //MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if entries.count == viewModel.totalEntries {
            allEntriesLoaded = true
        }
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntryCell.identifier, for: indexPath) as? EntryCell else {
            fatalError("The dequeued cell is not an instance  of EntryCell")
        }
        
        let entryData = entries[indexPath.row].data
        cell.setup(with: entryData)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if entries.count < viewModel.totalEntries {
            if indexPath.row == entries.count / 2 {
                viewModel.fetchTopEntries()
            }
        }
    }
    
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let isCollapsed = splitViewController?.isCollapsed else { return }
        if isCollapsed {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        let selectedEntry = entries[indexPath.row]
        delegate?.entrySelected(selectedEntry)
        if let entryDetailViewController = delegate as? EntryDetailViewController {
            splitViewController?.showDetailViewController(entryDetailViewController, sender: nil)
        }
    }
}


