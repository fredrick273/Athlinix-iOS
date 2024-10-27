import SwiftUI

struct cTeamsView: View {
    let teams = ["lakers", "toronto", "spurs1", "warriors"] // Replace with actual team images
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                // Add Team Button
                Button(action: {
                    // Add team action
                }) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2) // Decreased icon size
                            .foregroundColor(.gray)
                        Text("Add Team")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                            .font(.caption) // Smaller text size
                    }
                    .padding(8) // Adjusted padding to match smaller content
                    .cornerRadius(12) // Corner radius for the button
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3) // Soft shadow
                }
                
                // Team Entries
                ForEach(teams, id: \.self) { team in
                    VStack {
                        Image(team)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70) // Slightly smaller team images
                            .clipShape(Circle()) // Clip the image to a circle
                            .overlay(
                                Circle()
                                    .stroke(Color.blue, lineWidth: 0) // Circular border
                            )
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Shadow for team images
                        
                        Text(team.capitalized) // Capitalize the team name for readability
                            .foregroundColor(.primary)
                            .fontWeight(.medium)
                            .font(.caption) // Smaller font size for team names
                    }
                    .padding(.top, 8) // Adjusted padding
                }
            }
            .padding(.horizontal) // Horizontal padding for the scroll view
            .padding(.vertical, 10) // Vertical padding for spacing
        }
        .padding(.top, 20) // Top padding for the entire view
        .background(Color(.systemGroupedBackground)) // Background for the overall view
        .cornerRadius(15) // Rounded corners for the overall view
    }
}

struct cTeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(.systemGray6))
    }
}
