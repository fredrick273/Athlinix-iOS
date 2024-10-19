import SwiftUI

struct Explore: View {
    @Binding var selectedButton: String // Use binding to track the selected state
    @Environment(\.presentationMode) var presentationMode // Access the environment variable for navigation control
    
    var body: some View {
        VStack {
            // Custom Back Button
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Dismiss the current view and go back
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue) // Change color as needed
                        Text("Back")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.bottom,0).padding(.leading) // Padding for the button
                Spacer()
            }
            
            // Content of Explore Page
            InstagramFeedView() // Feed view integrated
            
            Spacer() // Add spacer to maintain layout balance
        }
        .navigationBarHidden(true) // Hide the navigation bar
        .edgesIgnoringSafeArea(.bottom) // Extend the view to the edges, removing the white space
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore(selectedButton: .constant("explore")) // Provide a default binding for previews
    }
}
