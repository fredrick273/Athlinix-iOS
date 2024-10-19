import SwiftUI
struct StatsView: View {
    var body: some View {
        HStack(spacing: 20) {
            StatItem(title: "Position", value: "PF")
            StatItem(title: "Matches", value: "24")
            StatItem(title: "Height", value: "6'11\"")
            StatItem(title: "Weight", value: "265 lbs")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        
        HStack(spacing: 20) {
            StatItem(title: "PPG", value: "17.8")
            StatItem(title: "BPG", value: "3.4")
            StatItem(title: "AST", value: "9")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

struct ProfileStatItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title)
                .bold()
            Text(title)
                .foregroundColor(.gray)
                .font(.subheadline)
        }
    }
}
