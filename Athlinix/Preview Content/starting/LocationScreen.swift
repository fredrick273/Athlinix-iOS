import SwiftUI

struct LocationScreen: View {
    @State private var location: String = ""

    var body: some View {
        VStack(alignment: .leading) { // Align content to the leading edge (left)
            VStack(alignment: .leading) {
                Image("location") // Replace with your actual logo asset name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 50) // Adjust the size as needed
                    .padding(.top, 40) // Padding at the top
                
                Text("Where do you live?")
                    .font(.title)
                    .padding(.top, 10) // Padding between logo and title
            }

            // Location entry
            TextField("Location", text: $location)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(5)
                .padding(.bottom, 20) // Padding below the TextField

            NavigationLink(destination: GenderScreen()) {
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
        }
        .navigationTitle("Location")
        .padding(.leading) // Add some padding on the leading edge
        .padding(.bottom, 20) // Additional bottom padding for overall spacing
    }
}

struct Location_Previews: PreviewProvider {
    static var previews: some View {
        LocationScreen() // Preview the LocationScreen
    }
}
