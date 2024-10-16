import SwiftUI

// HeaderView
struct HeaderView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("ATHLENIX")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()

                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
            }
            .padding(.top, 40) // Adjust padding for status bar overlap
            .padding(.horizontal)

            HStack {
                Image("logo") // Assuming you have an image named "profile"
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text("VIVEK JAGLAN")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading,40).padding()

                    HStack {
                        StatViewstat(label: "17.8", description: "PPG")
                        StatViewstat(label: "3.4", description: "BPG")
                        StatViewstat(label: "9", description: "AST")
                    }.padding(.leading,40)
                }
                
                Spacer()
            }
            .padding([.leading, .trailing], 20)
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 253/255, green: 100/255, blue: 48/255)) // FD6430 color
        .cornerRadius(40)
        .ignoresSafeArea(edges: .top) // Allow the header to extend above the safe area
    }
}

// StatView for displaying PPG, BPG, AST
struct StatViewstat: View {
    var label: String
    var description: String

    var body: some View {
        VStack {
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.7))
        }
        .frame(width: 50)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
