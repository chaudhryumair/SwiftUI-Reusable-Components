# SwiftUI Reusable Components

A clean collection of **general-purpose reusable SwiftUI components** that help you build iOS apps faster.

## Components Included

| Component | Description |
|-----------|-------------|
| `PrimaryButton` | Filled primary action button with loading state |
| `SecondaryButton` | Outline style secondary button |
| `AppTextField` | Text field with optional icon + error message |
| `AppCard` | Simple elevated card container |
| `LoadingOverlay` | Full-screen loading overlay + View modifier |
| `AvatarView` | Circular avatar with image or initials fallback |
| `BadgeView` | Pill-shaped badge / chip |
| `EmptyStateView` | Empty state with optional action button |
| `SectionHeader` | Section title with optional action |
| `ToastView` | Toast / snackbar with success/error/info styles |
| `SearchBar` | Clean search bar with clear button |

## Installation

### Swift Package Manager

Add this repository as a package dependency in Xcode:

```
https://github.com/chaudhryumair/SwiftUI-Reusable-Components
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/chaudhryumair/SwiftUI-Reusable-Components.git", from: "1.0.0")
]
```

## Usage Examples

```swift
import SwiftUIReusableComponents

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoading = false
    @State private var showToast = false

    var body: some View {
        VStack(spacing: 20) {
            AppTextField(placeholder: "Email", text: $email, icon: "envelope")
            AppTextField(placeholder: "Password", text: $password, icon: "lock", isSecure: true)

            PrimaryButton(title: "Sign In", isLoading: isLoading) {
                isLoading = true
                // your logic
            }

            SecondaryButton(title: "Create Account") { }
        }
        .padding()
        .loadingOverlay(isLoading)
        .toast(isPresented: $showToast, message: "Welcome back!", type: .success)
    }
}
```

## Preview

All components come with `#Preview` macros so you can see them instantly in Xcode.

## License

MIT
