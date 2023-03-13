
import UIKit

class RegistrationViewController_1: UIViewController {

    @IBOutlet weak var emailTextFieldRegistration: UITextField!
    @IBOutlet weak var errorEmailTextField: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingState()
        
    }
    func startingState(){
        emailTextFieldRegistration.text = ""
        errorEmailTextField.text = ""
        errorEmailTextField.isHidden = false
        nextButton.isEnabled = false
    }
    
    func invalidEmail(_ value: String) -> String? {
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value) {
            return "Invalid Email Address"
        }
        return nil
    }
    
    @IBAction func emailChanged(_ sender: Any) {
        if let email = emailTextFieldRegistration.text {
            if let errorMessage = invalidEmail(email) {
                errorEmailTextField.text = errorMessage
                errorEmailTextField.isHidden = false
            } else {
                errorEmailTextField.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func emailExist(email: String)-> Bool{
        if let email = emailTextFieldRegistration.text {
            if email == Users.checkForEmail(email: email) {
                errorEmailTextField.text = "Email already exists"
                return false
            }
        }
        return true
    }
    
    func checkForValidForm() {
        let email = emailTextFieldRegistration.text ?? ""
        if errorEmailTextField.isHidden && emailExist(email: email){
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let registrationViewTwo = storyboard.instantiateViewController(identifier: "registrationViewTwo") as? RegistrationViewController_2 else { return }
        registrationViewTwo.userEmail = emailTextFieldRegistration.text!
        show(registrationViewTwo, sender: nil)
        startingState()
    }
}
