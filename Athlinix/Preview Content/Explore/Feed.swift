import SwiftUI

struct UserProfileview {
    let name: String
    let profileImage: String
    let posts: [String]
}

struct ProfileView: View {
    let userProfile: UserProfileview
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                // User profile section
                HStack(spacing: 15) {
                    Image(userProfile.profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    Text(userProfile.name)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.horizontal)

                // Posts Grid
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 3), spacing: 5) {
                    ForEach(userProfile.posts, id: \.self) { post in
                        Image(post)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let userProfile = UserProfileview(
            name: "John Doe",
            profileImage: "profile_image", // Replace with actual image name
            posts: [
                "logo", "apple", "google", "profile",
                "image5", "image6", "image7", "image8"
            ]
        )
        
        ProfileView(userProfile: userProfile)
    }
}
