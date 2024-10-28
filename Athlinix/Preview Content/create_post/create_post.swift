import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedImages: [UIImage] = []
    @State private var isImagePickerPresented = false
    @State private var team1Score: Int = 0
    @State private var team2Score: Int = 0
    @State private var selectedImageItem: PhotosPickerItem?
    @State private var selectedMembers: [InviteMember] = []
    // Maximum number of images allowed
    let maxImages = 5
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Image Grid Section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(selectedImages.indices, id: \.self) { index in
                                Image(uiImage: selectedImages[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                            
                            if selectedImages.count < maxImages {
                                PhotosPicker(selection: $selectedImageItem,
                                           matching: .images) {
                                    AddImageButton()
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Destination Button
                    Button(action: {
                        // Handle destination action
                    }) {
                        HStack {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.orange)
                            Text("Destination")
                                .foregroundColor(.primary)
                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                    }
                    
                    // Teams Section
                    HStack(spacing: 40) {
                        // Team 1
                        TeamScoreView(
                            teamLogo: "lakersLogo",
                            teamName: "South Cali",
                            subTitle: "Your Team",
                            score: $team1Score
                        )
                        
                        Text("VS")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        // Team 2
                        TeamScoreView(
                            teamLogo: "plus",
                            teamName: "Add",
                            subTitle: "Opponent",
                            score: $team2Score
                        )
                    }
                    .padding()

                    // Members Section
                    VStack {
                        Text("Members")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)

                        // Adjust the NavigationLink here
                        NavigationLink(destination: InviteView(selectedMembers: $selectedMembers)) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding() // Add some padding to the plus icon
                                .background(Color.orange) // Optional: Add background color
                                .clipShape(Circle()) // Optional: Make it round
                        }
                    }
                    .padding(.top, 10) // Optional: Add padding to the top for better spacing
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Create Post")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .onChange(of: selectedImageItem) { newItem in
            Task {
                if let data = try? await newItem?.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    selectedImages.append(image)
                }
            }
        }
    }
}

// MARK: - Supporting Views
struct AddImageButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth: 1, dash: [5]))
            .frame(width: 300, height: 300)
            .overlay(
                Image(systemName: "plus")
                    .font(.system(size: 40))
                    .foregroundColor(.gray)
            )
    }
}

struct TeamScoreView: View {
    let teamLogo: String
    let teamName: String
    let subTitle: String
    @Binding var score: Int
    
    var body: some View {
        VStack(spacing: 12) {
            Image(teamLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Text(teamName)
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text(subTitle)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Button(action: { if score > 0 { score -= 1 } }) {
                    Image(systemName: "minus.circle")
                        .font(.title2)
                }
                
                Text("\(score)")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(minWidth: 40)
                
                Button(action: { score += 1 }) {
                    Image(systemName: "plus.circle")
                        .font(.title2)
                }
            }
        }
    }
}

// Preview
struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
