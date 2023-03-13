
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func login()-> Bool{
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                if Users.checkUserExistance(email: email, password: password) == true {
                    return true
                }
            }
        }
        return false
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                if Users.checkUserExistance(email: email, password: password) == true {
                    let userLogin = Users.returnUser(email: email, password: password)
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let profileViewController = storyBoard.instantiateViewController( withIdentifier: "profileView"
                    ) as! ProfileViewController
                    profileViewController.age = userLogin.age
                    profileViewController.email = email
                    profileViewController.password = password
                    profileViewController.username = userLogin.username
                    profileViewController.phone = userLogin.phone
                    
                    self.present(profileViewController, animated: true, completion: nil)
                    emailTextField.text = ""
                    passwordTextField.text = ""
                } else {
                    emailTextField.text = ""
                    passwordTextField.text = ""
                }
            }
        }
    }
}
