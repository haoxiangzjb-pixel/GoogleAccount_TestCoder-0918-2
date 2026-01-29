import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private let titleLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        configureNotifications()
    }
    
    // MARK: - UI Setup
    
    private func setupViews() {
        view.backgroundColor = .systemBackground
        
        titleLabel.text = "Hello, World!"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        actionButton.setTitle("Tap Me", for: .normal)
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(actionButton)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            
            actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50)
        ])
    }
    
    private func configureNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(appWillEnterForeground),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.titleLabel.alpha = 0.5
            self.titleLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.titleLabel.alpha = 1.0
                self.titleLabel.transform = CGAffineTransform.identity
            }
        }
    }
    
    @objc private func appWillEnterForeground() {
        print("App will enter foreground")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
