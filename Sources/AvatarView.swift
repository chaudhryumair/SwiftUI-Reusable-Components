import SwiftUI

public struct AvatarView: View {
    let url: String?
    let initials: String
    var size: CGFloat = 48
    
    public init(url: String? = nil, initials: String, size: CGFloat = 48) {
        self.url = url
        self.initials = initials
        self.size = size
    }
    
    public var body: some View {
        Group {
            if let url, let imageURL = URL(string: url) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFill()
                    default:
                        initialsView
                    }
                }
            } else {
                initialsView
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
    
    private var initialsView: some View {
        Text(initials)
            .font(.system(size: size * 0.38, weight: .semibold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.accentColor)
    }
}

#Preview {
    HStack(spacing: 16) {
        AvatarView(initials: "JD", size: 40)
        AvatarView(initials: "AB", size: 56)
        AvatarView(initials: "XY", size: 72)
    }
}
