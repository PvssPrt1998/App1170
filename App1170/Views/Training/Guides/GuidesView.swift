import SwiftUI

struct GuidesView: View {
    
    @EnvironmentObject var source: Source
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 12) {
                ForEach(source.guides, id: \.self) { guide in
                    NavigationLink {
                        GuideView(guide: guide)
                    } label: {
                        GuideCard(guide: guide)
                            .overlay(isLockedView(guide: guide))
                    }
                    .disabled(isLocked(guide))
                }
            }
            .padding(.bottom, 8)
        }
    }
    
    @ViewBuilder private func isLockedView(guide: Guide) -> some View {
        if isLocked(guide) {
            VStack(spacing: 12) {
                Image(systemName: "lock")
                    .font(.system(size: 36, weight: .regular))
                    .foregroundColor(.white)
                
                Text("Read previous guides to read this one")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.5))
            .clipShape(.rect(cornerRadius: 10))
        } else {
            Color.clear
        }
    }
    
    func isLocked(_ guide: Guide) -> Bool {
        if guide.id == 1 {
            return false
        } else if source.guides[guide.id - 2].readed {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    GuidesView()
        .environmentObject(Source())
}
