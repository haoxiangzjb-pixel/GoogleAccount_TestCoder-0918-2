//
//  RandomlyNamedViewController.swift
//  RandomApp
//
//  Created by Assistant on 2023-10-27.
//

import UIKit

class RandomlyNamedViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Random View"
    }
}