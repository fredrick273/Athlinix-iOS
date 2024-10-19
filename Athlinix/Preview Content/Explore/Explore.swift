import SwiftUI

struct Explore: View {
    @Binding var selectedButton: String // Use binding to track the selected state
    
    var body: some View {
        InstagramFeedView() // Feed view integrated
        Spacer() // Add spacer to maintain layout balance
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore(selectedButton: .constant("explore")) // Provide a default binding for previews
    }
}
