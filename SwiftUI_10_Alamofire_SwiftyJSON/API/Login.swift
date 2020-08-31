import Alamofire
import Combine
import Foundation

class Login: ObservableObject {
    
    @Published var authentication = 0
    
    func loginRequest(email: String, password: String) {
        let params: Parameters = [
            "email": email,
            "password": password
        ]
        
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        
        DispatchQueue.main.async {
            Alamofire.request(url, method: .post, parameters: params).responseJSON { (response) in
                if let result = response.result.value {
                    let json = result as! NSDictionary
                    if (json.value(forKey: "token") != nil) {
                        self.authentication = 1
                    } else if (json.value(forKey: "error") != nil) {
                        self.authentication = -1
                    }
                }
            }
        }        
    }
    
}
