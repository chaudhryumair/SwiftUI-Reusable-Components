import SwiftUI

public struct AppCard<Content: View>: View {
    let content: Content
    var padding: CGFloat = 16
    
    public init(padding: CGFloat = 16, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.padding = padding
    }
    
    public var body: some View {
        content
            .padding(padding)
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.08), radius: 8, y: 4)
    }
}

#Preview {
    AppCard {
        VStack(alignment: .leading, spacing: 8) {
            Text("Card Title")
                .font(.headline)
            Text("This is a reusable card component with soft shadow.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    .padding()
}
