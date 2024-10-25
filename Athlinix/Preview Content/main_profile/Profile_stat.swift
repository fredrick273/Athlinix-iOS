import SwiftUI

struct StatsView: View {
    let stats: [Stat] = [
        Stat(title: "Position", value: "PF"),
        Stat(title: "Matches", value: "24"),
        Stat(title: "Height", value: "6'11\""),
        Stat(title: "Weight", value: "265 lbs")
    ]
    
    let performanceStats: [Stat] = [
        Stat(title: "PPG", value: "17.8"),
        Stat(title: "BPG", value: "3.4"),
        Stat(title: "AST", value: "9")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            // Using a grid structure for general stats
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                ForEach(stats) { stat in
                    StatItemp(title: stat.title, value: stat.value)
                }
            }
            .padding(.horizontal) // Horizontal padding for the grid
            
            // Centering performance stats in their own containers
            HStack(spacing: 20) {
                ForEach(performanceStats) { stat in
                    StatItemp(title: stat.title, value: stat.value)
                        .frame(maxWidth: 80) // Fixed width for better alignment
                }
            }
            .padding(.horizontal) // Horizontal padding for the performance stats
            
            // HStack for Follow and Share buttons
             // Adjust padding as needed
        }
        .padding(.vertical) // Vertical padding for the whole view
        .background(Color(.systemGroupedBackground)) // Background for a grouped effect
        .cornerRadius(20) // Round corners for the whole view
    }
}

struct StatItemp: View {
    let title: String
    let value: String
    
    @State private var isTapped = false // State to manage tap animation
    
    var body: some View {
        VStack(spacing: 5) { // Reduced spacing between title and value
            Text(value)
                .font(.system(size: 13, weight: .bold, design: .rounded)) // Increased font size for visibility
                .foregroundColor(.primary)
            Text(title)
                .foregroundColor(.secondary)
                .font(.system(size: 14, weight: .medium)) // Font size for title
                .accessibilityLabel("\(title): \(value)")
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: 50) // Reduced minimum height
        .padding(10) // Reduced padding for smaller boxes
        .background(isTapped ? Color.blue.opacity(0.1) : Color(.white)) // Change background on tap
        .cornerRadius(10) // Reduced corner radius
        .shadow(color: Color.gray.opacity(0.1), radius: 3, x: 0, y: 1) // Reduced shadow for a softer effect
        .onTapGesture {
            isTapped.toggle() // Toggle tapped state
            print("\(title) tapped")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isTapped.toggle() // Reset the tap state after a short delay
            }
        }
    }
}

struct Stat: Identifiable, Hashable {
    let id = UUID() // Unique identifier for each stat
    let title: String
    let value: String
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .padding()
            .previewLayout(.sizeThatFits)
            .background(Color(.systemGray6))
    }
}
