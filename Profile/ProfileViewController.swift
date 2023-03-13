
import UIKit

class ProfileViewController: UIViewController {
    
    var email = "",
        password  = "",
        phone = "",
        age = "",
        username = ""
    
    var id = Int.random(in: 1000...9999)
    
    @IBOutlet weak var usernameField: UILabel!
    
    @IBOutlet weak var emailField: UILabel!
    
    @IBOutlet weak var phoneField: UILabel!
    
    @IBOutlet weak var passwordField: UILabel!
    
    @IBOutlet weak var ageField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameField.text = "\(username)#\(id)"
        emailField.text = email
        passwordField.text = password
        phoneField.text = phone
        ageField.text = age
    }

}
