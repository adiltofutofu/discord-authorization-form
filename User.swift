
import UIKit

public struct Users {
    private static var userList: [Users] = []
    private var email: String = ""
    private var username: String = ""
    private var password: String = ""
    private var phone: String = ""
    private var age: String = ""
    
    init(email: String, username: String, password: String, phone: String, age: String) {
        self.email = email
        self.username = username
        self.password = password
        self.phone = phone
        self.age = age
    }
    
     static func addUser(newUser: Users) {
        userList.append(newUser)
    }
    
    static func returnUser(email: String, password: String)-> (phone: String, age: String, username: String){
        for user in Users.userList {
            if user.email == email && user.password == password {
                return (user.phone, user.age, user.username)
            }
        }
        return ("","","")
    }
    
    static func checkUserExistance(email: String, password: String)-> Bool{
        for user in Users.userList {
            if user.email == email && user.password == password {
                return true
            }
        }
        return false
    }
    
    static func printUsers(){
        print(userList)
    }
    
    static func checkForEmail(email: String)-> String{
        for user in userList {
            if user.email == email {
                return email
            }
        }
        return ""
    }
    
    static func checkForPhone(phone: String)-> String{
        for user in Users.userList {
            if user.phone == phone {
                return phone
            }
        }
        return ""
    }
}
