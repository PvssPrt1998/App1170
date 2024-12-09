import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ZStack {
            Color.c505686.ignoresSafeArea()
            Color.c7984104
            VStack(spacing: 0) {
                header
                
                Button {
                    if let url = URL(string: "https://www.termsfeed.com/live/83b568c1-07e6-424c-8887-35f5262eefbb") {
                        openURL(url)
                    }
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "doc.fill")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.c255230143)
                        Text("Usage Policy")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(height: 44)
                    .padding(.horizontal, 16)
                    .background(Color.c313771)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                Button {
                    actionSheet()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "square.and.arrow.up.fill")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.c255230143)
                        Text("Share app")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(height: 44)
                    .padding(.horizontal, 16)
                    .background(Color.c313771)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                Button {
                    SKStoreReviewController.requestReviewInCurrentScene()
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "star.fill")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.c255230143)
                        Text("Rate Us")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(height: 44)
                    .padding(.horizontal, 16)
                    .background(Color.c313771)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: " https://apps.apple.com/us/app/cs-forcecs-cases-easy-drop/id6738993703")  else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        if #available(iOS 15.0, *) {
            UIApplication
            .shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }?.rootViewController?
            .present(activityVC, animated: true, completion: nil)
        } else {
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }
    
    private var header: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.c255230143)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .background(Color.c505686)
    }
}

#Preview {
    SettingsView()
}

extension SKStoreReviewController {
    public static func requestReviewInCurrentScene() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            DispatchQueue.main.async {
                requestReview(in: scene)
            }
        }
    }
}
