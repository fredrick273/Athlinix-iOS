import SwiftUI

struct cProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Blurred background using the same profile image
                Image("coach") // Replace with your actual profile image
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 250)
                    .blur(radius: 0)
                    .clipped()
                    .edgesIgnoringSafeArea(.all)
                    .shadow(radius: 50)
                    .padding(.bottom, 60)
                
                VStack {
                    // Circle profile image in the middle
                    Image("cavs") // Replace with your actual profile image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.top, 50)
                        .shadow(radius: 10)
                    
                    // Best Game at the bottom
                }
                .padding(.top, 120) // Adjust the spacing if necessary
            }
            .overlay(
                NavigationLink(destination: DestinationView()) {
                    Image("lakers") // Replace with your Windows logo image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30) // Adjust size as needed
                        .padding()
                }
                .buttonStyle(PlainButtonStyle()), // To remove default button appearance
                alignment: .topTrailing
            )
        }
    }
}

// Destination view to navigate to
struct DestinationView: View {
    var body: some View {
        Image("licence")
            .font(.largeTitle)
            .padding()
    }
}

struct cProfileView_Previews: PreviewProvider {
    static var previews: some View {
        cProfileView()
    }
}
