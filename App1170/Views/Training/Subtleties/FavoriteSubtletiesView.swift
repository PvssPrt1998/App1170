import SwiftUI

struct FavoriteSubtletiesView: View {
    @EnvironmentObject var source: Source
    
    var body: some View {
        if source.subtleties.filter({$0.isFavorite}).isEmpty {
            Text("There are no entries in favorites")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 140)
                .frame(maxHeight: .infinity, alignment: .top)
        } else {
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    ForEach(source.subtleties.filter{$0.isFavorite}, id: \.self) { subtletie in
                        SubtletieCard(subtletie: subtletie)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 28, bottom: 8, trailing: 28))
            }
        }
    }
}

#Preview {
    FavoriteSubtletiesView()
        .environmentObject(Source())
}
