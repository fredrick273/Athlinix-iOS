import SwiftUI
struct BestGameView1: View {
    var body: some View {
        VStack {
            Text("Best Game")
                .font(.headline)
                .padding(.bottom, 10)
            
            // Placeholder for Best Game Info
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(height: 150)
                .shadow(radius: 5)
                .padding(.horizontal)
        }
        .padding(.top)
    }
}
