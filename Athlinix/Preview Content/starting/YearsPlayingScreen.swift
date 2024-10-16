import SwiftUI

struct YearsPlayingScreen: View {
    @State private var selectedYears: Int = 0
    let yearsOptions = Array(0...100) // Create an array from 0 to 100

    var body: some View {
        VStack {
            Text("How many years have you been playing?")
                .font(.title)
                .padding()

            // Customized Picker for years played with wheel style
            Picker("Years", selection: $selectedYears) {
                ForEach(yearsOptions, id: \.self) { year in
                    Text("\(year)").tag(year)
                }
            }
            .pickerStyle(WheelPickerStyle()) // Use wheel style for a scrolling effect
            .frame(maxHeight: 200) // Adjust the height to suit the wheel display
            .padding()

            NavigationLink(destination: HomeScreen()) {
                Text("Finish")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 253/255, green: 100/255, blue: 48/255))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Years Playing")
        .padding(.horizontal) // Add horizontal padding to the entire screen
    }
}

struct YearsPlaying_Previews: PreviewProvider {
    static var previews: some View {
        YearsPlayingScreen() // Preview the YearsPlayingScreen
    }
}
