import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var subtitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        subtitleLabel.adjustsFontSizeToFitWidth = true
    }
}
