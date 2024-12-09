import SwiftUI

struct MistakeView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var mistake: Mistake
    @EnvironmentObject var source: Source
    
    var body: some View {
        ZStack {
            Color.c505686.ignoresSafeArea()
            Color.c7984104
            
            VStack(spacing: 0) {
                header
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        Text("\(mistake.id). " + mistake.title)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(mistake.text1)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Image(mistake.image1)
                            .resizable()
                            .scaledToFit()
                        Text(mistake.text2)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Image(mistake.image2)
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
            Text("Mistakes")
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
            Image(systemName: mistake.isFavorite ? "star.fill" : "star")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 22)
                .foregroundColor(.c255230143)
                .onTapGesture {
                    mistake.isFavorite.toggle()
                }
                .padding(.trailing, 16)
            ,alignment: .trailing
        )
        .background(Color.c505686)
        .onDisappear {
            favoriteToggle()
            mistake.readed = true
            source.mistakeReaded(mistake)
        }
    }
    
    func favoriteToggle() {
        source.mistakeFavoriteToggle(mistake)
    }
}

#Preview {
    MistakeView(mistake: Mistake(id: 1, title: "Poor Crosshair Placement", image: "mistake1", image1: "mistake11", image2: "mistake12", text1: "• Aiming at the ground or too high reduces reaction time.", text2: "• Always aim at head level where enemies are likely to appear.", isFavorite: false, readed: false))
        .environmentObject(Source())
}
