import SwiftUI
import Charts

// Struct for storing points data
struct GoalData: Identifiable {
    var id = UUID()
    var category: String
    var points: Double
}

// Data for each category and their points
let goalData: [GoalData] = [
    GoalData(category: "2pt Field Goals", points: 850),
    GoalData(category: "3pt Field Goals", points: 550),
    GoalData(category: "Free Throws", points: 210)
]

// Total points dynamically calculated
let totalPoints = goalData.reduce(0) { $0 + $1.points }

// Pie Chart View
struct PieChartViewStat: View {
    var body: some View {
        Chart(goalData) { item in
            SectorMark(
                angle: .value("Points", item.points / totalPoints * 360), // Proportional angles
                innerRadius: .ratio(0.5), // Donut-style chart
                outerRadius: .ratio(1.0)
            )
            .foregroundStyle(by: .value("Category", item.category)) // Color by category
            .annotation(position: .overlay) { // Add percentage labels inside the chart
                Text(String(format: "%.1f%%", (item.points / totalPoints) * 100))
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .chartForegroundStyleScale([
            "2pt Field Goals": Color.green,  // Custom color for 2pt field goals
            "3pt Field Goals": Color.blue,   // Custom color for 3pt field goals
            "Free Throws": Color.orange      // Custom color for free throws
        ])
        .chartLegend(position: .bottom) // Display legend at the bottom
        .frame(height: 400) // Adjust height as needed
    }
}

// Main View with One Pie Chart
struct AllStatsWithPieChartView: View {
    var body: some View {
        VStack {
            Text("Total Goals - \(Int(totalPoints))") // Dynamically show total goals
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
                .padding(.bottom, 10)
            
            PieChartViewStat() // Display the pie chart
                .padding()
            
//            Text("Breakdown of Points by Category") // Additional subtitle for clarity
//                .font(.footnote)
//                .foregroundColor(.gray)
//                .padding(.top, 5)
        }
        .padding()
        .background(Color(UIColor.systemBackground).opacity(0.95)) // Background for contrast
        .cornerRadius(12)
        .shadow(radius: 5)
    }
}

// Preview Provider
struct AllStatsWithPieChartView_Previews: PreviewProvider {
    static var previews: some View {
        AllStatsWithPieChartView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
