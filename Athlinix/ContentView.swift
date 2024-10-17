import SwiftUI

struct LogoScreen: View {
    @State private var selectedButton: String = "home" // Default selected button

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: HomeScreen(selectedButton: $selectedButton)) { // Pass binding to HomeScreen
                    Image("logo") // Replace with your logo image
                        .resizable()
                        .frame(width: 200, height: 150)
                }
                Spacer()
            }
            .navigationTitle("Welcome")
            .navigationBarHidden(true) // Hide the navigation bar if needed
        }
    }
}

struct LogoScreen_Previews: PreviewProvider {
    static var previews: some View {
        LogoScreen() // Preview the LogoScreen
    }
}
