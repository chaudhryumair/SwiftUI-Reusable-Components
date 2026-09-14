import SwiftUI

public struct ToastView: View {
    let message: String
    var type: ToastType = .info
    
    public enum ToastType {
        case success, error, info
        
        var color: Color {
            switch self {
            case .success: return .green
            case .error:   return .red
            case .info:    return .blue
            }
        }
        
        var icon: String {
            switch self {
            case .success: return "checkmark.circle.fill"
            case .error:   return "xmark.circle.fill"
            case .info:    return "info.circle.fill"
            }
        }
    }
    
    public init(message: String, type: ToastType = .info) {
        self.message = message
        self.type = type
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            Image(systemName: type.icon)
                .foregroundStyle(type.color)
            Text(message)
                .font(.subheadline)
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String
    let type: ToastView.ToastType
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                Spacer()
                if isPresented {
                    ToastView(message: message, type: type)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                withAnimation { isPresented = false }
                            }
                        }
                }
            }
            .animation(.spring(), value: isPresented)
        }
    }
}

public extension View {
    func toast(isPresented: Binding<Bool>, message: String, type: ToastView.ToastType = .info) -> some View {
        modifier(ToastModifier(isPresented: isPresented, message: message, type: type))
    }
}

#Preview {
    VStack(spacing: 12) {
        ToastView(message: "Saved successfully", type: .success)
        ToastView(message: "Something went wrong", type: .error)
        ToastView(message: "New update available", type: .info)
    }
}
