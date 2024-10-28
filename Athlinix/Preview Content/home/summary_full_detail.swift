import SwiftUI

struct TorapsStatsView: View {
    var body: some View {
        VStack {
            // Top Bar
            HStack {
                Image(systemName: "chevron.left")
                    .padding()
                Spacer()
                Text("Player wise stats")
                    .font(.headline)
                Spacer()
            }
            .padding(.top, 20)
            
            // Score Header with 16-point padding
            HStack {
                VStack {
                    
                        Image("lakers") // 76ers team logo
                            .resizable()
                            .scaledToFit()
                        .frame(width: 60, height: 60)
                    Text("Lakers")
                        .font(.caption)
                }
                
                Spacer()
                
                Text("60")
                    .font(.system(size: 40, weight: .bold))
                
                Text("VS")
                    .font(.title)
                
                Text("31")
                    .font(.system(size: 40, weight: .bold))
                
                Spacer()
                
                VStack {
                    Image("bulls") // Raptors team logo
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    Text("Bulls")
                        .font(.caption)
                        .foregroundColor(Color(hex: "#FF5116")) // Set color to orange
                }
            }
            .padding(.horizontal, 16) // Add horizontal padding of 16 points
            .padding(.vertical)
            
            // Tabs with equal width spacing
            HStack {
                VStack {
                    Text("76ers")
                        .font(.subheadline)
                        .foregroundColor(.gray) // Set color to gray for 76ers
                }
                .frame(maxWidth: .infinity) // Take up 1/3 of the space
                
                VStack {
                    Text("toraps")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#FF5116")) // Set color to orange
                    Rectangle()
                        .fill(Color(hex: "#FF5116")) // Underline with custom color
                        .frame(width: 120, height: 2) // Underline with 120pt width and 2pt height
                        .offset(y: -4) // Slightly move the line up if needed for visual alignment
                }
                .frame(maxWidth: .infinity) // Take up 1/3 of the space
                
                VStack {
                    NavigationLink(destination: eStatsView()) {
                                        Text("Stats")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }

                }
                .frame(maxWidth: .infinity) // Take up 1/3 of the space
            }
            .padding(.horizontal)
            
            // Table Headers
            HStack {
                Text("Player")
                    .font(.system(size: 14, weight: .semibold)) // Semibold font size 14
                    .foregroundColor(.gray)
                Spacer()
                Text("reb")
                    .font(.system(size: 14, weight: .semibold)) // Semibold font size 14
                    .foregroundColor(.gray)
                Text("ast")
                    .font(.system(size: 14, weight: .semibold)) // Semibold font size 14
                    .foregroundColor(.gray)
                Text("foul")
                    .font(.system(size: 14, weight: .semibold)) // Semibold font size 14
                    .foregroundColor(.gray)
                Text("pts ")
                    .font(.system(size: 14, weight: .semibold)) // Semibold font size 14
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.top, 8)
            
            // Player Stats List
            List(0..<5) { _ in
                HStack {
                    Text("John Hart")
                    Spacer()
                    Text("45  ")
                    Text("8   ")
                    Text("0  ")
                    Text("10")
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

// Extension for custom hex color
extension Color {
    init(hexaa: String) {
        let hexaa = hexaa.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexaa).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hexaa.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0) // Fallback to black if the format is invalid
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct TorapsStatsView_Previews: PreviewProvider {
    static var previews: some View {
        TorapsStatsView()
    }
}
