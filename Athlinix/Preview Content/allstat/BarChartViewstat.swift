import SwiftUI
import Charts

// Your existing ScoreData1 model
struct ScoreData1: Identifiable, Codable {
    var id = UUID()
    var period: String
    var points: Double
}

// Your existing ScoreDataCollection model
struct ScoreDataCollection: Codable {
    var monthly: [ScoreData1]
    var weekly: [ScoreData1]
    var annual: [ScoreData1]
}

// Your existing DataLoader class
class DataLoader {
    static func loadData() -> ScoreDataCollection? {
        guard let url = Bundle.main.url(forResource: "ScoreData", withExtension: "json") else {
            print("Data file not found")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(ScoreDataCollection.self, from: data)
        } catch {
            print("Error decoding data: \(error)")
            return nil
        }
    }
}

// BarChartViewstat
struct BarChartViewstat: View {
    @Binding var selectedOption: String
    @State private var scoreData: ScoreDataCollection?

    var body: some View {
        let data: [ScoreData1]
        let yAxisRange: ClosedRange<Double>
        let yAxisStride: Double

        // Load the data
        if scoreData == nil {
            scoreData = DataLoader.loadData()
        }

        // Choose data based on the selected option and set Y-axis range
        switch selectedOption {
        case "Monthly":
            data = scoreData?.monthly ?? []
            yAxisRange = 0...250
            yAxisStride = 50
        case "Weekly":
            data = scoreData?.weekly ?? []
            yAxisRange = 0...100
            yAxisStride = 20
        case "Annual":
            data = scoreData?.annual ?? []
            yAxisRange = 0...5000
            yAxisStride = 1000
        default:
            data = []
            yAxisRange = 0...250
            yAxisStride = 50
        }

        // Bar Chart
        return Chart(data) { item in
            BarMark(
                x: .value("Period", item.period),
                y: .value("Points", item.points)
            )
            .foregroundStyle(Color(red: 253/255, green: 100/255, blue: 48/255)) // Custom color
        }
        .chartYAxis {
            AxisMarks(values: .stride(by: yAxisStride))
        }
        .chartXAxis {
            AxisMarks(values: .automatic)
        }
        .chartYScale(domain: yAxisRange)
        .frame(height: 200)
    }
}

// Preview Provider
struct BarChartViewstat_Previews: PreviewProvider {
    @State static var selectedOption = "Monthly" // Set default value for preview

    static var previews: some View {
        BarChartViewstat(selectedOption: $selectedOption)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
