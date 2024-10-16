import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack(alignment: .top) {
            // Main Content
            ScrollView {
                VStack(spacing: 10) {
                    // Points Scored Section
                    HStack {
                        Text("Points Scored")
                            .font(.headline)
                            .padding(.leading)

                        Spacer()

                        NavigationLink(destination: AllStatsViewstat()) {
                            Text("See All")
                                .foregroundColor(.blue)
                                .padding(.trailing)
                        }
                    }.padding(.top,220)
                     // Adjust top padding as needed

                    // Bar Chart for Points Scored Section
                    LineChartView()
                        .frame(height: 200) // Adjusted height for better fit
                        .padding()

                    // Placeholder for additional content
                }
                .padding(.horizontal)
                .padding(.bottom)
                HStack {Text("Pinned Matches").font(.headline).padding(.leading)
                    Spacer()
                    NavigationLink(destination: AllMatchesList()) {
                        Text("See All")
                            .foregroundColor(.blue)
                        .padding(.trailing)}
                }
                .padding(.top, 10).padding(.horizontal)
                MatchSummaryViewFormat1(
                                        teamA: "Lakers",
                                        teamB: "Spurs",
                                        scoreA: 110,
                                        scoreB: 105,
                                        date: "Oct 13, 2024",
                                        team1Stats: MatchStats(fieldGoals: 25, threePFieldGoals: 10, freeThrows: 15),
                                        team2Stats: MatchStats(fieldGoals: 20, threePFieldGoals: 8, freeThrows: 12)
                                    ).padding(.horizontal)
                
                ImageViewer(imageName: "highlight", matchDetails: "Lakers vs BFI, Miami")
                                        .padding(.horizontal)
                                        .padding(.top, 10)
                
                ProfileSliderView()
                                        .padding(.top, 10)
                
                BarChartView().padding(.top,50)
                                        
                
                
                
            }

            // Header Section
            HeaderView()
                .padding(.top, 0)
                .ignoresSafeArea(edges: .top)
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.white)
        .navigationBarHidden(true)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
