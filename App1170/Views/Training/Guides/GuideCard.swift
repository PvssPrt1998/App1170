import SwiftUI

struct GuideCard: View {
    
    @EnvironmentObject var source: Source
    @State var guide: Guide
    
    var body: some View {
        Image("guideCard")
            .resizable()
            .scaledToFill()
            .frame(width: 356, height: 100)
            .overlay(overlayView)
    }
    
    private var overlayView: some View {
        HStack(spacing: 0) {
            Text("\(guide.id).")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .top)
            Text(guide.title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .frame(width: 272)
                .padding(.top, 10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            Image(systemName: guide.isFavorite ? "star.fill" : "star")
                .font(.system(size: 24, weight: .regular))
                .foregroundColor(.c255230143)
                .onTapGesture {
                    favoriteToggle()
                }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .padding(10)
    }
    
    func favoriteToggle() {
        guide.isFavorite.toggle()
        source.guideFavoriteToggle(guide)
    }
}

#Preview {
    GuideCard(guide: Guide(id: 1, title: "awawwa", image1: "guide11", image2: "guide12", image3: "guide13", text1: "text1", text2: "text2", text3: "text3", isFavorite: false, readed: false))
        .environmentObject(Source())
}
