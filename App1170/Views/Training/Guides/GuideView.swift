import SwiftUI

struct GuideView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var guide: Guide
    @EnvironmentObject var source: Source
    
    var body: some View {
        ZStack {
            Color.c505686.ignoresSafeArea()
            Color.c7984104
            
            VStack(spacing: 0) {
                header
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        Text("\(guide.id). " + guide.title)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(guide.text1)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Image(guide.image1)
                            .resizable()
                            .scaledToFit()
                        Text(guide.text2)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Image(guide.image2)
                            .resizable()
                            .scaledToFit()
                        Text(guide.text3)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Image(guide.image3)
                            .resizable()
                            .scaledToFit()
                    }
                    .padding(EdgeInsets(top: 10, leading: 34, bottom: 8, trailing: 34))
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    private var header: some View {
        VStack {
            Text("Guides")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.c255230143)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .overlay(
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                HStack(spacing: 3) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.c255230143)
                    
                    Text("Back")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(.c255230143)
                }
                .padding(.horizontal, 8)
            }
            , alignment: .leading
        )
        .overlay(
            Image(systemName: guide.isFavorite ? "star.fill" : "star")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 22)
                .foregroundColor(.c255230143)
                .onTapGesture {
                    guide.isFavorite.toggle()
                }
                .padding(.trailing, 16)
            ,alignment: .trailing
        )
        .background(Color.c505686)
        .onDisappear {
            favoriteToggle()
            guide.readed = true
            source.guideReaded(guide)
        }
    }
    
    func favoriteToggle() {
        source.guideFavoriteToggle(guide)
    }
}

#Preview {
    GuideView(guide: Guide(id: 1, title: "awawwa", image1: "guide11", image2: "guide12", image3: "guide13", text1: "text1", text2: "text2", text3: "text3", isFavorite: false, readed: false))
        .environmentObject(Source())
}
