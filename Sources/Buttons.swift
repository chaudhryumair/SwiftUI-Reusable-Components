import SwiftUI

public struct PrimaryButton: View {
    let title: String
    var isLoading: Bool = false
    var isDisabled: Bool = false
    let action: () -> Void
    
    public init(title: String, isLoading: Bool = false, isDisabled: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.isLoading = isLoading
        self.isDisabled = isDisabled
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                        .scaleEffect(0.85)
                }
                Text(title)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(isDisabled || isLoading ? Color.gray : Color.accentColor)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .disabled(isDisabled || isLoading)
    }
}

public struct SecondaryButton: View {
    let title: String
    var isDisabled: Bool = false
    let action: () -> Void
    
    public init(title: String, isDisabled: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.isDisabled = isDisabled
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .foregroundStyle(isDisabled ? .gray : .accentColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(isDisabled ? Color.gray : Color.accentColor, lineWidth: 1.5)
                )
        }
        .disabled(isDisabled)
    }
}

#Preview {
    VStack(spacing: 16) {
        PrimaryButton(title: "Continue") {}
        PrimaryButton(title: "Loading...", isLoading: true) {}
        SecondaryButton(title: "Cancel") {}
    }
    .padding()
}
