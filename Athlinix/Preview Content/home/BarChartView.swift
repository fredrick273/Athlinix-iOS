import SwiftUI
import Charts

// Updated Data Structure for Bar Chart Comparison with Custom Categories
struct ComparisonData: Identifiable {
    var id = UUID()
    var category: String
    var team: String
    var points: Double
}

// Sample data for both teams based on custom categories
let customComparisonData = [
    ComparisonData(category: "Overall MVP", team: "Matches Played", points: 150),
    ComparisonData(category: "Overall MVP", team: "Points Scored", points: 180),
    ComparisonData(category: "Tournaments", team: "Matches Played", points: 170),
    ComparisonData(category: "Tournaments", team: "Points Scored", points: 190),
    ComparisonData(category: "Stand Alone", team: "Matches Played", points: 120),
    ComparisonData(category: "Stand Alone", team: "Points Scored", points: 160)
]

// Bar Chart View for custom categories
struct BarChartView: View {
    var body: some View {
        Chart(customComparisonData) { data in
            BarMark(
                x: .value("Category", data.category), // Custom x-axis categories
                y: .value("Points", data.points)
            )
            .foregroundStyle(by: .value("Team", data.team)) // Different color for each team
            .position(by: .value("Team", data.team)) // Side-by-side grouping
        }
        .chartYAxis {
            AxisMarks(values: .stride(by: 50)) // Y-Axis with 50 units stride
        }
        .chartXAxis {
            AxisMarks(values: .automatic) // Automatically handle category labels
        }
        .frame(height: 350)
        .padding().padding(.bottom,50)
    }
}

// Preview for BarChartView
struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
