//
//  MyViewController.swift
//  MyApp
//
//  Created by Assistant on 2023-10-27.
//

import UIKit

class MyViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "My View"
    }
}