import SwiftUI

struct AllMatchesScreen: View {
    var body: some View {
        VStack {
            // Title for the screen
            Text("Matches")
                .font(.largeTitle)
                .padding()
            
            // Call the AllMatchesList view here
            AllMatchesList()
            
            Spacer()
        }
        .navigationTitle("All Matches")
    }
}

struct AllMatchesScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllMatchesScreen()
    }
}
