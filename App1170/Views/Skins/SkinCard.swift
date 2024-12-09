import SwiftUI

struct SkinCard: View {
    
    @EnvironmentObject var source: Source
    let skin: Skin
    @State var showEdit = false
    
    var body: some View {
        VStack(spacing: 8) {
            
            setImage(skin.image)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 175)
                .clipShape(.rect(cornerRadius: 16))
                .clipped()
            
            
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(skin.name)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                    Text(skin.tag)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .trailing, spacing: 10) {
                    Text(skin.price)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                    HStack(spacing: 8) {
                        Button {
                            source.removeSkin(skin)
                        } label: {
                            Image(systemName: "trash.fill")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                            .frame(width: 60, height: 30)
                            .background(Color.c2555948)
                            .clipShape(.rect(cornerRadius: 40))
                        }
                        Button {
                            showEdit = true
                        } label: {
                            HStack(spacing: 3) {
                                Image(systemName: "pencil")
                                    .font(.system(size: 17, weight: .semibold))
                                    .foregroundColor(.c576391)
                                Text("Edit")
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundColor(.c576391)
                            }
                            .frame(width: 69, height: 30)
                            .background(Color.c255230143)
                            .clipShape(.rect(cornerRadius: 40))
                        }
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
        .background(
            Image("SubtletieBackground")
            .resizable()
        )
        .sheet(isPresented: $showEdit) {
            EditSkinView(skin: skin, show: $showEdit)
        }
    }
    
    private func setImage(_ data: Data) -> Image {
        guard let image = UIImage(data: data) else {
            return Image(systemName: "camera.fill")
        }
        return Image(uiImage: image)
    }
}

#Preview {
    SkinCard(skin: Skin(uuid: UUID(), image: Data(), name: "name", price: "price", tag: "tag"))
        .environmentObject(Source())
        .padding()
}
