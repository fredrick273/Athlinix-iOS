import SwiftUI

struct GenderScreen: View {
    @State private var selectedGender: String = ""

    var body: some View {
        VStack {
            Text("Select your gender")
                .font(.title)
                .padding()

            Picker("Gender", selection: $selectedGender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Other").tag("Other")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: ProfilePhotoScreen()) {
                Text("Next")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Gender")
    }
}

#Preview {
    GenderScreen()
}
