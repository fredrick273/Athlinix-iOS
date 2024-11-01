import SwiftUI

struct coachexp: View {
    @State private var selectedSkillLevel: Int = 0 // Use Int instead of String
    @Binding var selectedButton: String // Declare a binding for selectedButton
    let skillLevels = Array(0...30) // Range from 0 to 30

    var body: some View {
        VStack {
            Text("Years of Experience")
                .font(.title)
                .padding()

            // Customized Picker for skill level with wheel style
            Picker("Years of Experience", selection: $selectedSkillLevel) {
                ForEach(skillLevels, id: \.self) { level in
                    Text("\(level)").tag(level) // Display each number as a tag
                }
            }
            .pickerStyle(WheelPickerStyle()) // Use wheel style for a scrolling effect
            .frame(maxHeight: 200) // Adjust the height to suit the wheel display
            .padding()

            NavigationLink(destination: CoachCertificationScreen(selectedButton: $selectedButton)) { // Pass the binding here
                Text("Next")
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
        .navigationTitle("Skill Level")
        .padding(.horizontal) // Add horizontal padding to the entire screen
    }
}

struct coach_exp: PreviewProvider {
    static var previews: some View {
        // Create a preview with a dummy binding
        @State var dummyButton: String = "home"
        return coachexp(selectedButton: $dummyButton) // Pass a binding for preview
    }
}
