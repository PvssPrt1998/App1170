import SwiftUI

struct SubtletieView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var subtletie: Subtletie
    @EnvironmentObject var source: Source
    
    var body: some View {
        ZStack {
            Color.c505686.ignoresSafeArea()
            Color.c7984104
            
            VStack(spacing: 0) {
                header
                ScrollView(.vertical) {
                    VStack(spacing: 10) {
                        Text("\(subtletie.id). " + subtletie.title)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Text(subtletie.text1)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Image(subtletie.image1)
                            .resizable()
                            .scaledToFit()
                        Text(subtletie.text2)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        Image(subtletie.image2)
                            .resizable()
                            .scaledToFit()
                        if subtletie.text3 != "" {
                            Text(subtletie.text3)
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            Image(subtletie.image3)
                                .resizable()
                                .scaledToFit()
                        }
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
            Text("Subtleties")
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
            Image(systemName: subtletie.isFavorite ? "star.fill" : "star")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 22)
                .foregroundColor(.c255230143)
                .onTapGesture {
                    subtletie.isFavorite.toggle()
                }
                .padding(.trailing, 16)
            ,alignment: .trailing
        )
        .background(Color.c505686)
        .onDisappear {
            favoriteToggle()
            subtletie.readed = true
            source.subtletieReaded(subtletie)
        }
    }
    
    func favoriteToggle() {
        source.subtletieFavoriteToggle(subtletie)
    }
}

#Preview {
    SubtletieView(subtletie: Subtletie(id: 1, title: "Use Sound to Your Advantage", image: "Subtletie1", image1: "subtletie11", image2: "subtletie12", image3: "subtletie13", text1: "• Enemy footsteps reveal direction and proximity.", text2: "• Shift-walking (crouch or walk) makes you silent but slower.", text3: "• Fake defuse sounds can bait opponents into revealing their position.", isFavorite: false, readed: false))
        .environmentObject(Source())
}
