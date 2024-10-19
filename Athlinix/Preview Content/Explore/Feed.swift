import SwiftUI

struct InstagramFeedView: View {
    @State private var likedPosts: Set<UUID> = [] // Track liked posts by their IDs
    @State private var comments: [UUID: String] = [:] // Track comments for each post
    @State private var commentInput: String = "" // Input field for comments

    let posts: [Post] = [
        Post(user: User(name: "john_doe", profileImage: "person.circle.fill"), images: ["feed1", "feed3"], likes: 120, caption: "Just scored the game-winning shot!", teamLogo: "lakers"),
        Post(user: User(name: "jane_smith", profileImage: "person.circle.fill"), images: ["feed2", "feed4", "feed5"], likes: 85, caption: "Had an amazing game under the sun!", teamLogo: "spurs1"),
        Post(user: User(name: "alex_king", profileImage: "person.circle.fill"), images: ["feed7", "feed6"], likes: 200, caption: "Exploring new plays with my teammates.", teamLogo: "pistons"),
        Post(user: User(name: "mary_queen", profileImage: "person.circle.fill"), images: ["profile3"], likes: 64, caption: "Enjoying a victory celebration!", teamLogo: "warriors"),
        Post(user: User(name: "iamalsauser", profileImage: "person.circle.fill"), images: ["feed3"], likes: 64, caption: "Practicing my free throws at the court.", teamLogo: "toronto"),
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(posts) { post in
                    VStack(alignment: .leading, spacing: 10) {
                        // User profile section
                        HStack {
                            Image(systemName: post.user.profileImage)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .padding(.trailing, 10)

                            Text(post.user.name)
                                .font(.headline)
                                .foregroundColor(.primary) // Text color

                            Spacer()

                            Image(systemName: "ellipsis")
                                .padding(.trailing, 10)
                                .foregroundColor(.gray) // Gray color for the ellipsis
                        }
                        .padding(.horizontal)

                        // Post images (carousel if more than one image)
                        if post.images.count == 1 {
                            Image(post.images[0])
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: .infinity)
                                .cornerRadius(15)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Soft shadow
                        } else {
                            TabView {
                                ForEach(post.images, id: \.self) { imageName in
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity)
                                        .cornerRadius(15)
                                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                                }
                            }
                            .frame(height: 300)
                            .tabViewStyle(PageTabViewStyle())
                        }

                        // Like and share buttons with team logo
                        HStack(spacing: 25) {
                            Button(action: {
                                toggleLike(for: post.id)
                            }) {
                                Image(systemName: likedPosts.contains(post.id) ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(likedPosts.contains(post.id) ? .red : .gray) // Change color based on like status
                            }
                            Button(action: {}) {
                                Image(systemName: "square.and.arrow.up") // Share icon
                                    .resizable()
                                    .frame(width: 20, height: 26)
                                    .foregroundColor(.green) // Change color for better visibility
                            }

                            Spacer()

                            // Team logo image for each post
                            Image(post.teamLogo)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2)) // White stroke for contrast
                        }
                        .padding(.horizontal)

                        // Likes and caption section
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(post.likes + (likedPosts.contains(post.id) ? 1 : 0)) likes") // Update like count dynamically
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.secondary) // Secondary color for better readability
                                .padding(.leading, 10)

                            Text(post.user.name)
                                .font(.headline) +
                            Text(" \(post.caption)")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal)

                        // Comment section
                        if let comment = comments[post.id], !comment.isEmpty {
                            Text("Comment: \(comment)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .padding(.horizontal)
                        }

                        // Comment input
                        HStack {
                            TextField("Add a comment...", text: $commentInput)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)

                            Button("Post") {
                                if !commentInput.isEmpty {
                                    comments[post.id] = commentInput // Save comment
                                    commentInput = "" // Clear input after posting
                                }
                            }
                            .padding(.trailing)
                        }

                        // Add some padding between posts
                        Divider()
                    }
                    .padding(.vertical) // Add vertical padding to each post
                    .background(Color.white) // White background for posts
                    .cornerRadius(15) // Rounded corners for the post container
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5) // Soft shadow for the post container
                }
            }
            .padding(.horizontal) // Add horizontal padding to the entire view
            .background(Color(UIColor.systemGray6)) // Light gray background for the overall view
        }
    }

    private func toggleLike(for postId: UUID) {
        if likedPosts.contains(postId) {
            likedPosts.remove(postId) // Remove like if already liked
        } else {
            likedPosts.insert(postId) // Add like if not liked yet
        }
    }
}

// Models
struct User {
    let name: String
    let profileImage: String
}

struct Post: Identifiable {
    let id = UUID()
    let user: User
    let images: [String] // Supports multiple images
    let likes: Int
    let caption: String
    let teamLogo: String // Added team logo to the post model
}

// Preview
struct InstagramFeedView_Previews: PreviewProvider {
    static var previews: some View {
        InstagramFeedView()
    }
}
