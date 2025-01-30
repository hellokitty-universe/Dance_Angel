import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the default background color
        view.backgroundColor = .black
    }

    // Custom method for screen navigation with a seamless animation
    func navigateTo(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve // Smooth fade animation
        self.present(viewController, animated: true, completion: nil)
    }
}
