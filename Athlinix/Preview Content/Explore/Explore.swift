import SwiftUI

struct Explore: View {
    @Binding var selectedButton: String // Use binding to track the selected state
    
    var body: some View {
        //        VStack(alignment: .leading) {
        //            // Trending container at the top
        //            Text("Global Team Leaderboard")
        //                .font(.title2)
        //                .padding(.bottom, 10).padding()
        //
        //            // Example leaderboard data
        //            VStack(spacing: 15) {
        //                HStack {
        //                    Text("1. Lakers")
        //                    Spacer()
        //                    Text("Wins: 60")
        //                }
        //
        //                HStack {
        //                    Text("2. Warriors")
        //                    Spacer()
        //                    Text("Wins: 58")
        //                }
        //
        //                HStack {
        //                    Text("3. Spurs")
        //                    Spacer()
        //                    Text("Wins: 55")
        //                }
        //
        //                HStack {
        //                    Text("4. Celtics")
        //                    Spacer()
        //                    Text("Wins: 53")
        //                }
        //
        //                HStack {
        //                    Text("5. Heat")
        //                    Spacer()
        //                    Text("Wins: 50")
        //                }
        //            }
        //            .padding()
        //            .background(Color.gray.opacity(0.1))
        //            .cornerRadius(10)
        //            .padding()
        //
        //            Spacer()
        //
        //            // Example button to set Explore as selected
        //
        //
        //            Spacer()
        ////        }
        //        .navigationTitle("Explore") // Optional: set a title for navigation
        //        .navigationBarHidden(false) // Optional: show navigation bar
        //    }
        //}
        InstagramFeedView()
        Spacer()
    }
    struct Explore_Previews: PreviewProvider {
        static var previews: some View {
            Explore(selectedButton: .constant("explore")) // Provide a default binding for previews
        }
    }
}
