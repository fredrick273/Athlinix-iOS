import SwiftUI

struct Explore: View {
    @Binding var selectedButton: String // Use binding to track the selected state

    var body: some View {
        VStack {
            // Your Explore content here
            Text("Explore Page")
                .font(.largeTitle)
                .padding()

            // Example of how to change the selected button
            Button(action: {
                selectedButton = "explore"
            }) {
                Text("Set Explore as Selected")
            }
        }
        .navigationTitle("Explore") // Optional: set a title for navigation
        .navigationBarHidden(false) // Optional: show navigation bar
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore(selectedButton: .constant("explore")) // Provide a default binding for previews
    }
}
