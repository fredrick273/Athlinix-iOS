import SwiftUI

struct RoleSelectionScreen: View {
    @State private var selectedRole: String = ""

    var body: some View {
        VStack(alignment: .leading) { // Align content to the leading edge (left)
            VStack(alignment: .leading) {
                Image("role") // Replace with your actual logo asset name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50) // Adjust the size as needed
                    .padding(.all, 20) // Padding around the logo
                
                Text("Are you a coach or athlete?")
                    .font(.title)
                    .padding(.all, 10) // Padding between logo and title
            }

            Picker("Role", selection: $selectedRole) {
                Text("Coach").tag("Coach")
                Text("Athlete").tag("Athlete")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: AthleteHeightScreen()) {
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
        .navigationTitle("Role Selection")
        .padding(.horizontal) // Add horizontal padding to the entire screen
    }
}

struct RoleSelection: PreviewProvider {
    static var previews: some View {
        RoleSelectionScreen() // Preview the RoleSelectionScreen
    }
}
