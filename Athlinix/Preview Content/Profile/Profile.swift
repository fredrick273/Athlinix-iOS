import SwiftUI

struct ProfileStat: View {
    @Binding var selectedButton: String // Use binding to track the selected state

    var body: some View {
        VStack {
            // Your Profile content here
            Text("Profile Page")
                .font(.largeTitle)
                .padding()

            // Example of how to change the selected button
            Button(action: {
                selectedButton = "profile"
            }) {
                Text("Set Profile as Selected")
            }
        }
        .navigationTitle("Profile") // Optional: set a title for navigation
        .navigationBarHidden(false) // Optional: show navigation bar
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileStat(selectedButton: .constant("profile")) // Provide a default binding for previews
    }
}
