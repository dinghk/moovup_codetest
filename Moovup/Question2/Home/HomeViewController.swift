//
//  HomeViewController.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    // state
    private let viewModel: HomeViewModel
    // lazy
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.register(PersonItemCell.self, forCellReuseIdentifier: PersonItemCell.description())
        return tableView
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        viewModel.fetchPeopleListAPI()
    }

    private func setupUI() {
//        view.addSubview(tableView)
//        tableView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(16)
//            make.leading.trailing.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
    }
    
}
