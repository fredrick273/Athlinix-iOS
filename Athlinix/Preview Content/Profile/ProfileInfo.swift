import SwiftUI

struct ProfileInfoView: View {
    var body: some View {
        VStack {
            // Profile Image and Name with Verified Tick
            HStack(spacing: 5) {
                Text("Parth Sinh")
                    .font(.title)
                    .bold().padding(.leading)

                // Verified tick image (make sure you have an image named "verifiedTick" in your assets)
                Image(systemName: "checkmark.seal.fill") // Or replace with your custom image if you have one
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 253 / 255, green: 100 / 255, blue: 48 / 255))
 // Change the color to match the verified tick design
            }

            // Role and experience
            Text("Player - 11yrs exp.")
                .foregroundColor(.gray)
            
            // Bio text
            Text("Basketball player with a passion for the game, always hustling and chasing... More")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
//        .padding(.top, 15)
    }
}

struct ProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoView()
    }
}
