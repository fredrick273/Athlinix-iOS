import SwiftUI

struct CreateAccountScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            Text("Athlinix")
                .font(.largeTitle)
                .padding()
            
            TextField("Enter your email", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding()
            
            TextField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding()
            
            NavigationLink(destination: PhoneNumberScreen()) {
                Text("Next")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 253/255, green: 100/255, blue: 48/255))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()

            // Don't have an account? Sign up
            Text("Don't have an account? Sign up")
                .font(.subheadline)
                .foregroundColor(.blue)
                .padding(.top, 20)

            // Continue with Accounts
            Text("Continue with Accounts")
                .font(.headline)
                .padding(.top, 20)

            // Logos for Apple and Google
            HStack {
                // Replace "apple_logo" and "google_logo" with the actual names of your logo images in the assets folder
                Image("apple")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50) // Adjust the size as needed
                
                Spacer().frame(width: 20) // Spacing between logos

                Image("google")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50) // Adjust the size as needed
            }
            .padding(.top, 10)

            Spacer()
        }
//        .navigationTitle("Account Creation")
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountScreen() // Preview the CreateAccountScreen
    }
}
