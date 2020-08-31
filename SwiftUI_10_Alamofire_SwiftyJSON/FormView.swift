
import SwiftUI

struct FormView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @ObservedObject var login = Login()
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Email")
                .font(.system(.title, design: .rounded))
            TextField("Coloca tu email", text: self.$email)
            Text("Password")
                .font(.system(.title, design: .rounded))
            SecureField("Coloca tu password", text: self.$password)
            HStack {
                Spacer()
                Button(action: {
                    self.login.loginRequest(email: self.email, password: self.password)
                }) {
                    Text("Entrar")
                        .font(.system(.title, design: .rounded))
                }
                if self.login.authentication == 1 {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(.title, design: .rounded))
                        .foregroundColor(.green)
                        .background(Color(.systemGray5))
                } else if self.login.authentication == -1 {
                    Image(systemName: "xmark.shield.fill")
                        .font(.system(.title, design: .rounded))
                        .foregroundColor(.red)
                        .background(Color(.systemGray5))
                }
                Spacer()
            }
        }.padding()
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
