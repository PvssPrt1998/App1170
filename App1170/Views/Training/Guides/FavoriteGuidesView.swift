import SwiftUI

struct FavoriteGuidesView: View {
    
    @EnvironmentObject var source: Source
    
    var body: some View {
        if source.guides.filter({$0.isFavorite}).isEmpty {
            Text("There are no entries in favorites")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 140)
                .frame(maxHeight: .infinity, alignment: .top)
        } else {
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    ForEach(source.guides.filter{$0.isFavorite}, id: \.self) { guide in
                        NavigationLink {
                            GuideView(guide: guide)
                        } label: {
                            GuideCard(guide: guide)
                        }
                    }
                }
                .padding(.bottom, 8)
            }
        }
    }
}

#Preview {
    FavoriteGuidesView()
        .environmentObject(Source())
}
