import SwiftUI

struct AllStatsViewstat: View {
    @State private var selectedOption: String = "Monthly" // Default selected option
    var totalPoints = 1260
    var gamesPlayed = 63
    var pointsPerGame = 24.3
    var percentageChange = 3.5

    var body: some View {
        ScrollView { // Wrap content in ScrollView
            VStack(alignment: .leading, spacing: 10) {
                // Use StatsSummaryView to display the summary
                StatsSummaryView(totalPoints: totalPoints, gamesPlayed: gamesPlayed)
                    .padding(.bottom, 0).padding(.top, 0)
                
                // Scoring Efficiency Container with the Line Chart
                ScoringEfficiencyView(pointsPerGame: pointsPerGame, percentageChange: percentageChange, pointsData: sampleData1)
                    .padding(.bottom, 0)
                
                // Detailed Stats View with Assists and Rebounds
                DetailedStatsView(chartData1: sampleData1, chartData2: sampleData2)
                    .padding(.top, 0).padding(.bottom, 0)
                
                // Segmented Picker for Time Frame Selection
                Picker("Select Time Frame", selection: $selectedOption) {
                    Text("Monthly").tag("Monthly")
                    Text("Weekly").tag("Weekly")
                    Text("Annual").tag("Annual")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.vertical)
                
                // Bar Chart View
                BarChartViewstat(selectedOption: $selectedOption)
                    .padding(.bottom)

                // Pie Chart View
                PieChartViewStat() // Call the Pie Chart here
                    .padding(.bottom)

                Spacer()
            }
            .padding()
        }
    }
}

// Preview Provider
struct AllStatsViewstat_Previews: PreviewProvider {
    static var previews: some View {
        AllStatsViewstat() // Creating a preview for AllStatsViewstat
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
