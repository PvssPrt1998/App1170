import SwiftUI

struct FavoriteMistakesView: View {
    
    @EnvironmentObject var source: Source
    
    var body: some View {
        if source.mistakes.filter({$0.isFavorite}).isEmpty {
            Text("There are no entries in favorites")
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top, 140)
                .frame(maxHeight: .infinity, alignment: .top)
        } else {
            ScrollView(.vertical) {
                LazyVStack(spacing: 15) {
                    ForEach(source.mistakes.filter{$0.isFavorite}, id: \.self) { mistake in
                        MistakeCard(mistake: mistake)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 28, bottom: 8, trailing: 28))
            }
        }
    }
}

#Preview {
    FavoriteMistakesView()
        .environmentObject(Source())
}
