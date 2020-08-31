
import Foundation
import Alamofire
import SwiftyJSON
import Combine

class NetworkingManager: ObservableObject {
    
    @Published var usersList = [UserList]()
    
    init() {
        DispatchQueue.main.async {
            // Alamofire
            Alamofire.request("https://reqres.in/api/users?page=2").responseJSON { (response) in
                // SwiftyJSON
                switch response.result {
                case .success(let result):
                    let json = JSON(result)
                    for item in json["data"] {
                        let id = item.1["id"].int ?? 0
                        let first_name = item.1["first_name"].string ?? ""
                        let last_name = item.1["last_name"].string ?? ""
                        let email = item.1["email"].string ?? ""
                        let avatar = item.1["avatar"].string ?? ""
                        let user = UserList(id: id, email: email, first_name: first_name, last_name: last_name, avatar: avatar)
                        self.usersList.append(user)
                    }
                    print(self.usersList)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
