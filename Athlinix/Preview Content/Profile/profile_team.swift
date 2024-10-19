import SwiftUI
struct TeamsView: View {
    let teams = ["Kings", "T. Raptors", "GSW", "LAL"] // Replace with actual team images
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                Button(action: {
                    // Add team action
                }) {
                    VStack {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                        Text("Add Team")
                            .foregroundColor(.gray)
                    }
                }
                
                ForEach(teams, id: \.self) { team in
                    VStack {
                        Image(team)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        Text(team)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
