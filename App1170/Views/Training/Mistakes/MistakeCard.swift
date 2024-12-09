import SwiftUI

struct MistakeCard: View {
    
    @EnvironmentObject var source: Source
    @State var mistake: Mistake
    
    var body: some View {
        HStack(spacing: 14) {
            Image(mistake.image)
                .resizable()
                .scaledToFill()
                .frame(width: 93, height: 81)
            
            VStack {
                Text("\(mistake.id). " + mistake.title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.trailing, 50)
                NavigationLink {
                    MistakeView(mistake: mistake)
                } label: {
                    Text("Read")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 34)
                        .background(Color.c255230143)
                        .clipShape(.rect(cornerRadius: 40))
                }
                .padding(.trailing, 8)
            }
        }
        .padding(10)
        .overlay(
            Image(systemName: mistake.isFavorite ? "star.fill" : "star")
                .font(.system(size: 24, weight: .regular))
                .foregroundColor(.c255230143)
                .onTapGesture {
                    favoriteToggle()
                }
                .padding(10)
                 , alignment: .topTrailing)
        .background(LinearGradient(colors: [.c505686, .c153153153], startPoint: .top, endPoint: .bottom))
        .clipShape(.rect(cornerRadius: 10))
    }
    
    func favoriteToggle() {
        mistake.isFavorite.toggle()
        source.mistakeFavoriteToggle(mistake)
    }
}

#Preview {
    MistakeCard(mistake: Mistake(id: 1, title: "Poor Crosshair Placement", image: "mistake1", image1: "mistake11", image2: "mistake12", text1: "• Aiming at the ground or too high reduces reaction time.", text2: "• Always aim at head level where enemies are likely to appear.", isFavorite: false, readed: false))
        .environmentObject(Source())
}
