
import UIKit

class RegistrationViewController_3: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var usernameHintTextField: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorPasswordTextField: UILabel!
    
    var email = ""
    var phone = ""
    var age = ""
    
    @IBOutlet weak var createButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingState()
    }
    
    func startingState(){
        userNameTextField.text = ""
        passwordTextField.text = ""
        errorPasswordTextField.text = ""
        errorPasswordTextField.isHidden = false
        createButton.isEnabled = false
    }
    
    @IBAction func usernameChanged(_ sender: Any) {
    }
    
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = passwordTextField.text {
            if let errorMessage = invalidPassword(password) {
                errorPasswordTextField.text = errorMessage
                errorPasswordTextField.isHidden = false
            } else {
                errorPasswordTextField.isHidden = true
            }
        }
        
        checkForValidForm()
    }
    
    func invalidPassword(_ value: String) -> String? {
        if value.count < 8 {
            return "Password must be at least 8 characters"
        }
        if containsDigit(value) {
            return "Password must contain at least 1 digit"
        }
        if containsLowerCase(value) {
            return "Password must contain at least 1 lowercase character"
        }
        if containsUpperCase(value) {
            return "Password must contain at least 1 uppercase character"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool {
        let reqularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool {
        let reqularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool {
        let reqularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func checkForValidForm() {
        if errorPasswordTextField.isHidden {
            createButton.isEnabled = true
        } else {
            createButton.isEnabled = false
        }
    }
    
    
    @IBAction func createAccountTapped(_ sender: Any) {
        var password = passwordTextField.text!
        var username = userNameTextField.text!
        var user = Users(email: email,
                         username: username,
                         password: password,
                         phone: phone,
                         age: age)
        Users.addUser(newUser: user)
        print(Users.printUsers())
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard segue.identifier == "view3toLaunch" else { return }
            guard let launchViewController = segue.destination as? LaunchViewController else { return }
        }
        startingState()
    }
}
