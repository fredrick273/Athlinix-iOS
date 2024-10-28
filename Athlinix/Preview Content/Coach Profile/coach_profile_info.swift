import SwiftUI

struct cProfileInfoView: View {
    var body: some View {
        VStack {
            // Profile Image and Name with Verified Tick
            HStack(spacing: 5) {
                Text("JJ Redick")
                    .font(.title)
                    .bold()
                    .padding(.leading)

                // Verified tick image
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(red: 253 / 255, green: 100 / 255, blue: 48 / 255))
            }
            
            // Follow button below the name
            Button(action: {
                // Add follow action here
            }) {
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 14)
                    .background(Color(red: 253 / 255, green: 100 / 255, blue: 48 / 255))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 5)

            // Role and experience
            Text("Coach - 11yrs exp.")
                .foregroundColor(.gray)
            
            // Bio text
            Text("Basketball Coach with a passion for the game, always hustling and chasi... More")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
    }
}

struct cProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        cProfileInfoView()
    }
}