//
//  MainViewController.swift
//  EnumSearch
//
//  Created by Thuy Truong Quang on 6/19/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    // Variables
    let searchController = UISearchController(searchResultsController: nil)
    var state = SearchState.loading {
        didSet {
            setFooterView()
            tableView.reloadData()
        }
    }
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        title = "EnumSearch"
        
        super.viewDidLoad()
        prepareNavigationBar()
        prepareSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchController.searchBar.becomeFirstResponder()
    }
    
    // MARK: - Private Function
    private func prepareNavigationBar() {
        let whiteTitleAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = Constants.darkColor
        navigationController?.navigationBar.titleTextAttributes = whiteTitleAttributes
    }
    
    private func prepareSearchBar() {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.autocorrectionType = .no
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barTintColor = .white
        
        let textFieldInSearchBar = UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        let whiteTitleAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        textFieldInSearchBar.defaultTextAttributes = whiteTitleAttributes
        
        navigationItem.searchController = searchController
        searchController.searchBar.becomeFirstResponder()
        
    }
    private func setFooterView() {
        switch state {
        case .error:
            tableView.tableFooterView = errorView
        case .empty:
            tableView.tableFooterView = emptyView
        case .loading:
            tableView.tableFooterView = loadingView
        case .populated:
            tableView.tableFooterView = nil
        case .paging:
            tableView.tableFooterView = loadingView
        }
    }
    private func loadPage(_ page: Int) {
        let querry = searchController.searchBar.text
        
    }
    @objc private func loadRecordings() {
        state = .loading
        loadPage(1)
    }
}

// MARK: - <#UISearchControllerDelegate#>
extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self,
                                               selector: #selector(loadRecordings),
                                               object: nil)
        perform(#selector(loadRecordings), with: nil, afterDelay: 0.5)
    }
}

// MARK: - <#UITableViewDataSource#>
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.currentRecordings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifierName, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.load(recording: state.currentRecordings[indexPath.row])
        
        if case .paging(_, let nextPage) = state,
            indexPath.row == state.currentRecordings.count - 1 {
            loadPage(nextPage)
        }
        return cell
    }
}
