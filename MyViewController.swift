import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        self.view.backgroundColor = UIColor.systemBackground
        
        // Add a label
        let label = UILabel()
        label.text = "Hello from MyViewController!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the view
        self.view.addSubview(label)
        
        // Add constraints for the label
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}