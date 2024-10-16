import SwiftUI

struct ImageViewer: View {
    var imageName: String
    var matchDetails: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200) // Adjust height as needed
            Text(matchDetails)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center) // Center the text if it wraps
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewer(imageName: "highlight", matchDetails: "Lakers vs BFI, Miami")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
