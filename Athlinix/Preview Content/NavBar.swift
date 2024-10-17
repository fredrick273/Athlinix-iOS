import SwiftUI

struct CustomNavBar: View {
    @Binding var selectedButton: String // Use binding to track selected state

    var body: some View {
        HStack {
            // Home Button
            NavigationLink(destination: HomeScreen(selectedButton: $selectedButton)) {
                VStack {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(selectedButton == "home" ? Color(red: 253/255, green: 100/255, blue: 48/255) : .gray)
                    Text("Home")
                        .font(.caption)
                        .foregroundColor(selectedButton == "home" ? Color(red: 253/255, green: 100/255, blue: 48/255) : .gray)
                }
            }
            .frame(maxWidth: .infinity)

            // Explore Button
            NavigationLink(destination: Explore(selectedButton: $selectedButton)) {
                VStack {
                    Image(systemName: "globe")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(selectedButton == "explore" ? Color(red: 253/255, green: 100/255, blue: 48/255) : .gray)
                    Text("Explore")
                        .font(.caption)
                        .foregroundColor(selectedButton == "explore" ? Color(red: 253/255, green: 100/255, blue: 48/255) : .gray)
                }
            }
            .frame(maxWidth: .infinity)

            // Profile Button
            NavigationLink(destination: ProfileStat(selectedButton: $selectedButton)) {
                VStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(selectedButton == "profile" ? Color(red: 253/255, green: 100/255, blue: 48/255) : .gray)
                    Text("Profile")
                        .font(.caption)
                        .foregroundColor(selectedButton == "profile" ? Color(red: 253/255, green: 100/255, blue: 48/255) : .gray)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color.white)
        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: -5) // Slight shadow for navbar
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar(selectedButton: .constant("home")) // Provide a default binding for previews
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
