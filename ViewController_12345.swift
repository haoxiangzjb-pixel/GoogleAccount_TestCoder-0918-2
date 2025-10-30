import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the view
        setupView()
    }
    
    private func setupView() {
        // Configure the view appearance
        view.backgroundColor = .systemBackground
        
        // Add a title
        title = "My View Controller"
        
        // Add any additional UI elements here
        let label = UILabel()
        label.text = "Welcome to My View!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Any setup needed before the view appears
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Any actions after the view appears
    }
}