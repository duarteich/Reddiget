//
//  MainViewController.swift
//  Reddiget
//
//  Created by Christyan Huber Duarte Ibanez on 16/04/21.
//

import UIKit

class MainViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        preferredDisplayMode = .oneBesideSecondary
    }
    
    func splitViewController(_ svc: UISplitViewController, topColumnForCollapsingToProposedTopColumn proposedTopColumn: UISplitViewController.Column) -> UISplitViewController.Column {
        return .primary
    }
}
