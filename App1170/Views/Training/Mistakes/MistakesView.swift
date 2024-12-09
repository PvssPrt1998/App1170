import SwiftUI

struct MistakesView: View {
    
    @EnvironmentObject var source: Source
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 15) {
                ForEach(source.mistakes, id: \.self) { mistake in
                    MistakeCard(mistake: mistake)
                        .overlay(isLockedView(mistake: mistake))
                        .disabled(isLocked(mistake))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 28, bottom: 8, trailing: 28))
        }
    }
    
    @ViewBuilder private func isLockedView(mistake: Mistake) -> some View {
        if isLocked(mistake) {
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
    
    func isLocked(_ mistake: Mistake) -> Bool {
        if mistake.id == 1 {
            return false
        } else if source.mistakes[mistake.id - 2].readed {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    MistakesView()
        .environmentObject(Source())
}
