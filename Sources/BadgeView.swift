import SwiftUI

public struct BadgeView: View {
    let text: String
    var color: Color = .accentColor
    var style: Style = .filled
    
    public enum Style {
        case filled, outline
    }
    
    public init(text: String, color: Color = .accentColor, style: Style = .filled) {
        self.text = text
        self.color = color
        self.style = style
    }
    
    public var body: some View {
        Text(text)
            .font(.caption.weight(.medium))
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(style == .filled ? color.opacity(0.15) : Color.clear)
            .foregroundStyle(color)
            .overlay(
                Capsule()
                    .stroke(style == .outline ? color : Color.clear, lineWidth: 1)
            )
            .clipShape(Capsule())
    }
}

#Preview {
    HStack {
        BadgeView(text: "New")
        BadgeView(text: "Pro", color: .purple)
        BadgeView(text: "Beta", color: .orange, style: .outline)
    }
}
