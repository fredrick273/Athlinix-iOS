import SwiftUI
import Charts

// Sample Data for the Line Chart
struct ChartData: Identifiable {
    var id = UUID()
    var month: String
    var points: Double
}

let sampleData = [
    ChartData(month: "Jan", points: 150),
    ChartData(month: "Feb", points: 170),
    ChartData(month: "Mar", points: 120),
    ChartData(month: "Apr", points: 200),
    ChartData(month: "May", points: 180),
    ChartData(month: "Jun", points: 220),
    ChartData(month: "Jul", points: 195),
    ChartData(month: "Aug", points: 170),
    ChartData(month: "Sep", points: 210),
    ChartData(month: "Oct", points: 230),
    ChartData(month: "Nov", points: 190),
    ChartData(month: "Dec", points: 250)
]

// StatView for displaying Month and Points
struct StatView: View {
    var month: String
    var points: Double

    var body: some View {
        VStack {
            Text(month)
                .font(.headline)
                .foregroundColor(.white)
            Text("\(points, specifier: "%.1f")") // Display points with one decimal
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
        }
        .frame(width: 50)
    }
}

// Line Chart View
struct LineChartView: View {
    var body: some View {
        Chart(sampleData) { data in
            LineMark(
                x: .value("Month", data.month),
                y: .value("Points", data.points)
            )
            .foregroundStyle(Color(red: 253/255, green: 100/255, blue: 48/255)) // FD6430 color
        }
        .chartYAxis {
            AxisMarks(values: .stride(by: 50)) // Y-Axis with 50 units stride
        }
        .chartXAxis {
            AxisMarks(values: .automatic) // Automatically handle month values
        }
    }
}

// Preview for StatView
struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(month: "Jan", points: 150)
    }
}
