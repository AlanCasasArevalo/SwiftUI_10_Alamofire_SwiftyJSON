
import Foundation
import Alamofire
import SwiftyJSON
import Combine

class NetworkingManager: ObservableObject {
    
    @Published var usersList = [UsersList]()
    
    init() {
        DispatchQueue.main.async {
            // Alamofire
            Alamofire.request("https://reqres.in/api/users?page=2").responseJSON { (response) in
                // SwiftyJSON
                switch response.result {
                case .success(let result):
                    let json = JSON(result)
                    for item in json["data"] {
                        print(item.1)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
