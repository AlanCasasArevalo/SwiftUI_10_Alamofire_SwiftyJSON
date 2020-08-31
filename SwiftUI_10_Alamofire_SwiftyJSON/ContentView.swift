
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var manager = NetworkingManager()
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
