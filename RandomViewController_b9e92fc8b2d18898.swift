import UIKit

class RandomViewController_b9e92fc8b2d18898: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        // Add a title
        title = "Random View Controller"
        
        // Add a sample button
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - Actions
    @objc private func buttonTapped() {
        let alert = UIAlertController(title: "Hello!", message: "Button was tapped!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}