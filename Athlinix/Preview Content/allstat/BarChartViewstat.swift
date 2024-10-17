import SwiftUI
import Charts

// Sample Data for the Bar Chart
struct ScoreData: Identifiable {
    var id = UUID()
    var period: String // This can be month, week, or year
    var points: Double
}

// Sample Data for Monthly, Weekly, and Annual views
let monthlyData: [ScoreData] = [
    ScoreData(period: "Jan", points: 150),
    ScoreData(period: "Feb", points: 170),
    ScoreData(period: "Mar", points: 120),
    ScoreData(period: "Apr", points: 200),
    ScoreData(period: "May", points: 180),
    ScoreData(period: "Jun", points: 220),
    ScoreData(period: "Jul", points: 195),
    ScoreData(period: "Aug", points: 170),
    ScoreData(period: "Sep", points: 210),
    ScoreData(period: "Oct", points: 230),
    ScoreData(period: "Nov", points: 190),
    ScoreData(period: "Dec", points: 250)
]

let weeklyData: [ScoreData] = [
    ScoreData(period: "Week 1", points: 50),
    ScoreData(period: "Week 2", points: 70),
    ScoreData(period: "Week 3", points: 100),
    ScoreData(period: "Week 4", points: 80)
]

let annualData: [ScoreData] = [
    ScoreData(period: "2021", points: 1800),
    ScoreData(period: "2022", points: 2100),
    ScoreData(period: "2023", points: 2000)
]

// Sample data for Scoring Efficiency View (array of tuples)
let sampleData1: [(String, Double)] = [
    ("Game 1", 15),
    ("Game 2", 20),
    ("Game 3", 18),
    ("Game 4", 25),
    ("Game 5", 30)
]

let sampleData2: [(String, Double)] = [
    ("Game 1", 10),
    ("Game 2", 25),
    ("Game 3", 20),
    ("Game 4", 15),
    ("Game 5", 30)
]

// Bar Chart View
struct BarChartViewstat: View {
    @Binding var selectedOption: String // Selected option for the chart

    var body: some View {
        let data: [ScoreData]
        let yAxisRange: ClosedRange<Double>
        let yAxisStride: Double

        // Choose data based on the selected option and set Y-axis range
        switch selectedOption {
                case "Monthly":
                    data = monthlyData
                    yAxisRange = 0...250 // Range for Monthly
                    yAxisStride = 50 // Stride for Monthly
                case "Weekly":
                    data = weeklyData
                    yAxisRange = 0...100 // Range for Weekly
                    yAxisStride = 20 // Stride for Weekly
                case "Annual":
                    data = annualData
                    yAxisRange = 0...5000 // Range for Annual
                    yAxisStride = 1000 // Stride for Annual
                default:
                    data = []
                    yAxisRange = 0...250 // Default range
                    yAxisStride = 50 // Default stride
                }

                // Bar Chart
                return Chart(data) { item in
                    BarMark(
                        x: .value("Period", item.period),
                        y: .value("Points", item.points)
                    )
                    .foregroundStyle(Color(red: 253/255, green: 100/255, blue: 48/255)) // FD6430 color
                }
                .chartYAxis {
                    AxisMarks(values: .stride(by: yAxisStride)) // Use the selected stride
                        /*.chartYAxis("Points")*/ // Optional: add label for clarity
                }
                .chartXAxis {
                    AxisMarks(values: .automatic) // Automatically handle period values
                }
                .chartYScale(domain: yAxisRange).frame(height: 200) // Set Y-axis range dynamically
    }
}

// Main View with Dynamic Chart
//struct AllStatsViewstat: View {
//    @State private var selectedOption: String = "Monthly" // Default selected option
//    var totalPoints = 1260
//    var gamesPlayed = 63
//    var pointsPerGame = 24.3
//    var percentageChange = 3.5
//
//    var body: some View {
//        ScrollView { // Wrap content in ScrollView
//            VStack(alignment: .leading, spacing: 10) {
//                // Use StatsSummaryView to display the summary
//                StatsSummaryView(totalPoints: totalPoints, gamesPlayed: gamesPlayed)
//                    .padding(.bottom, 0).padding(.top, 0)
//                
//                // Scoring Efficiency Container with the Line Chart
//                ScoringEfficiencyView(pointsPerGame: pointsPerGame, percentageChange: percentageChange, pointsData: sampleData1)
//                    .padding(.bottom, 0)
//                
//                // Detailed Stats View with Assists and Rebounds
//                DetailedStatsView(chartData1: sampleData1, chartData2: sampleData2)
//                    .padding(.top, 0).padding(.bottom, 0)
//                
//                // Segmented Picker for Time Frame Selection
//                Picker("Select Time Frame", selection: $selectedOption) {
//                    Text("Monthly").tag("Monthly")
//                    Text("Weekly").tag("Weekly")
//                    Text("Annual").tag("Annual")
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding(.vertical)
//                
//                // Bar Chart View
//                BarChartViewstat(selectedOption: $selectedOption)
//                    .padding(.bottom)
//                    
////                PieChartViewStat
//                
//                Spacer()
//            }
//            .padding()
//        }
//    }


// Preview Provider
struct AllStatsViewstat_Previewsstat: PreviewProvider {
    static var previews: some View {
        AllStatsViewstat() // Creating a preview for AllStatsViewstat
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
