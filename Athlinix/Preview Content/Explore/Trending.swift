import SwiftUI

struct TeamSliderView: View {
    // Example team data
    let teams: [Team] = [
        Team(name: "Lakers", winPercentage: 85.0, logo: "sportscourt.fill"),
        Team(name: "Warriors", winPercentage: 82.5, logo: "sportscourt.fill"),
        Team(name: "Spurs", winPercentage: 78.0, logo: "sportscourt.fill"),
        Team(name: "Celtics", winPercentage: 74.3, logo: "sportscourt.fill"),
        Team(name: "Heat", winPercentage: 70.0, logo: "sportscourt.fill")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Global Team Leaderboard")
                .font(.title2)
                .bold()
                .foregroundColor(.primary)
                .padding(.vertical, 10)
            
            // Horizontal Scroll View
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(teams, id: \.name) { team in
                        VStack {
                            // Circular progress view for win percentage
                            ZStack {
                                Circle()
                                    .stroke(lineWidth: 6)
                                    .opacity(0.2)
                                    .foregroundColor(.orange)
                                
                                Circle()
                                    .trim(from: 0.0, to: CGFloat(team.winPercentage / 100))
                                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                                    .foregroundColor(.orange)
                                    .rotationEffect(Angle(degrees: 270))
                                    .animation(.linear, value: team.winPercentage)
                                
                                // Team logo in the center of the progress view
                                Image(systemName: team.logo)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.orange)
                            }
                            .frame(width: 50, height: 50)
                            
                            // Team name and win percentage below the progress view
                            VStack(alignment: .center, spacing: 2) {
                                Text(team.name)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                
                                // Percentage label
                                Text("\(Int(team.winPercentage))%")
                                    .font(.caption)
                                    .padding(4)
                                    .background(Color.orange.opacity(0.1))
                                    .clipShape(Capsule())
                                    .foregroundColor(.orange)
                            }
                        }
                        .padding(.horizontal)
                        .frame(width: 80) // Fixed width for each team
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea()) // iOS native background
    }
}

// Model for Team data
struct Team {
    let name: String
    let winPercentage: Double
    let logo: String
}

struct TeamSliderView_Previews: PreviewProvider {
    static var previews: some View {
        TeamSliderView()
    }
}
