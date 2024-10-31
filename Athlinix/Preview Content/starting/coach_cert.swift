import SwiftUI
import UIKit

struct CoachCertificationScreen: View {
    @State private var certificationImage: UIImage? = nil // Store selected image
    @State private var showImagePicker = false // Toggle for image picker
    @State private var licenseNumber: String = "" // Store license number
    @Binding var selectedButton: String // Declare a binding for selectedButton

    var body: some View {
        VStack {
            Text("Coaching Certification")
                .font(.title)
                .padding()

            Button(action: {
                showImagePicker = true // Show image picker
            }) {
                if let image = certificationImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .cornerRadius(10)
                        .padding()
                } else {
                    Text("Upload Certification Image")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                }
            }
            .sheet(isPresented: $showImagePicker) {
                coachImagePicker(selectedImage: $certificationImage)
            }

            TextField("Enter license number (if any)", text: $licenseNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(maxWidth: .infinity)

            NavigationLink(destination: HomeScreen(selectedButton: $selectedButton)) {
                Text("Finish")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 253/255, green: 100/255, blue: 48/255))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(certificationImage == nil) // Disable button until image is uploaded

            Spacer()
        }
        .navigationTitle("Certification Proof")
        .padding(.horizontal)
    }
}

struct CoachCertificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        // Create a preview with a dummy binding
        @State var dummyButton: String = "home"
        return CoachCertificationScreen(selectedButton: $dummyButton)
    }
}

// Image picker wrapper for SwiftUI
struct coachImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: coachImagePicker

        init(_ parent: coachImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
