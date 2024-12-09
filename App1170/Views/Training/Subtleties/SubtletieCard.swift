import SwiftUI

struct SubtletieCard: View {
    
    @EnvironmentObject var source: Source
    @State var subtletie: Subtletie
    
    var body: some View {
        VStack(spacing: 0) {
            Image(subtletie.image)
                .resizable()
                .scaledToFit()
                .frame(height: 140)
            Text("\(subtletie.id). " + subtletie.title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
                .padding(.top, 12)
            NavigationLink {
                SubtletieView(subtletie: subtletie)
            } label: {
                Text("Read")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.c344075)
                    .frame(maxWidth: .infinity)
                    .frame(height: 34)
                    .background(Color.c255230143)
                    .clipShape(.rect(cornerRadius: 40))
            }
            .padding(.top, 6)
        }
        .padding(EdgeInsets(top: 16, leading: 17, bottom: 8, trailing: 17))
        .background(
            Image("SubtletieBackground")
                .resizable()
                .scaledToFill()
        )
        .overlay(
            Image(systemName: subtletie.isFavorite ? "star.fill" : "star")
                .font(.system(size: 24, weight: .regular))
                .foregroundColor(.c255230143)
                .padding(8)
                .onTapGesture {
                    favoriteToggle()
                }
                 , alignment: .topTrailing)
        .clipShape(.rect(cornerRadius: 10))
    }
    func favoriteToggle() {
        subtletie.isFavorite.toggle()
        source.subtletieFavoriteToggle(subtletie)
    }
}

#Preview {
    SubtletieCard(subtletie: Subtletie(id: 1, title: "Use Sound to Your Advantage", image: "Subtletie1", image1: "subtletie11", image2: "subtletie12", image3: "subtletie13", text1: "• Enemy footsteps reveal direction and proximity.", text2: "• Shift-walking (crouch or walk) makes you silent but slower.", text3: "• Fake defuse sounds can bait opponents into revealing their position.", isFavorite: false, readed: false))
        .padding()
        .background(Color.c7984104)
        .environmentObject(Source())
}
