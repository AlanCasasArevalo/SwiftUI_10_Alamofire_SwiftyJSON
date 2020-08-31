
import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var manager = NetworkingManager()
    
    var body: some View {
        NavigationView {
            VStack {
                List (self.manager.usersList) { user in
                    HStack {
                        AnimatedImage(url: URL(string: user.avatar))
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)
                        VStack {
                            Text(user.first_name)
                                .font(.system(.title, design: .rounded))
                            Text(user.last_name)
                                .font(.system(.headline, design: .rounded))
                            Text(user.email)
                                .font(.system(.subheadline, design: .rounded))
                        }
                    }
                    .navigationBarTitle("Alamofire", displayMode: .inline)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
