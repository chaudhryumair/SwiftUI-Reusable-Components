import SwiftUI

public struct LoadingOverlay: View {
    let message: String
    
    public init(message: String = "Loading...") {
        self.message = message
    }
    
    public var body: some View {
        ZStack {
            Color.black.opacity(0.35)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                ProgressView()
                    .scaleEffect(1.2)
                    .tint(.white)
                Text(message)
                    .foregroundStyle(.white)
                    .font(.subheadline)
            }
            .padding(24)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

public extension View {
    func loadingOverlay(_ isPresented: Bool, message: String = "Loading...") -> some View {
        overlay {
            if isPresented {
                LoadingOverlay(message: message)
            }
        }
    }
}

#Preview {
    Text("Hello")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .loadingOverlay(true, message: "Please wait...")
}
