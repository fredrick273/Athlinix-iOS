import SwiftUI

struct LogoScreen: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: HomeScreen()) {
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
