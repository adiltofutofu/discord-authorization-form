
import UIKit

class RegistrationViewController_2: UIViewController {
    
    var userEmail = ""
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var errorPhoneTextField: UILabel!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var errorAgeTextField: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingState()
    }
    
    func startingState(){
        phoneTextField.text = ""
        ageTextField.text = ""
        errorPhoneTextField.text = ""
        errorAgeTextField.text = ""
        errorAgeTextField.isHidden = false
        errorPhoneTextField.isHidden = false
        nextButton.isEnabled = false
    }
    
    @IBAction func phoneChanged(_ sender: Any) {
        if let phoneNumber = phoneTextField.text {
            if let errorMessage = invalidPhoneNumber(phoneNumber) {
                errorPhoneTextField.text = errorMessage
                errorPhoneTextField.isHidden = false
            } else {
                errorPhoneTextField.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidPhoneNumber(_ value: String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Phone Number must contain only digits"
        }
        
        if value.count != 11 {
            return "Phone Number must be 11 Digits in Length"
        }
        return nil
    }
    
    
    @IBAction func ageChanged(_ sender: Any) {
        if let age = ageTextField.text {
            if let errorMessage = invalidAge(age) {
                errorAgeTextField.text = errorMessage
                errorAgeTextField.isHidden = false
            } else {
                errorAgeTextField.isHidden = true
            }
        }
        checkForValidForm()
    }
    
    func invalidAge(_ value: String) -> String? {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return "Age must contain only digits"
        }
        
        if Int(value) ?? 0 <= 0 || Int(value) ?? 0 >= 110 {
            return "Invalid age"
        }
        return nil
    }
    
    
    func checkForValidForm() {
        let phone = phoneTextField.text ?? ""
        if errorPhoneTextField.isHidden && errorAgeTextField.isHidden && phoneExist(phone: phone){
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func phoneExist(phone: String)-> Bool{
        if let phone = phoneTextField.text {
            if phone == Users.checkForPhone(phone: phone){
                errorPhoneTextField.text = "Phone already exists"
                return false
            }
        }
        return true
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let registrationViewThird = storyboard.instantiateViewController(identifier: "registrationViewThird") as? RegistrationViewController_3 else { return }
        registrationViewThird.email = userEmail
        registrationViewThird.phone = phoneTextField.text!
        registrationViewThird.age = ageTextField.text!
        show(registrationViewThird, sender: nil)
        startingState()
    }
}
