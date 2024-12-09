import SwiftUI

struct SubtletiesView: View {
    
    @EnvironmentObject var source: Source
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 12) {
                ForEach(source.subtleties, id: \.self) { subtletie in
                    SubtletieCard(subtletie: subtletie)
                        .overlay(isLockedView(subtletie: subtletie))
                        .disabled(isLocked(subtletie))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 28, bottom: 8, trailing: 28))
        }
    }
    
    @ViewBuilder private func isLockedView(subtletie: Subtletie) -> some View {
        if isLocked(subtletie) {
            VStack(spacing: 12) {
                Image(systemName: "lock")
                    .font(.system(size: 36, weight: .regular))
                    .foregroundColor(.white)
                
                Text("Read previous guides to read this one")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.white)
            }
            .padding(.bottom, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.5))
            .clipShape(.rect(cornerRadius: 10))
        } else {
            Color.clear
        }
    }
    
    func isLocked(_ subtletie: Subtletie) -> Bool {
        if subtletie.id == 1 {
            return false
        } else if source.subtleties[subtletie.id - 2].readed {
            return false
        } else {
            return true
        }
    }
}

#Preview {
    SubtletiesView()
        .environmentObject(Source())
}
