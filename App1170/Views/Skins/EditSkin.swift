import SwiftUI

struct EditSkinView: View {
    
    @EnvironmentObject var source: Source
    @Binding var show: Bool
    
    let uuid: UUID
    @State var image: Data?
    @State var name: String
    @State var price: String
    @State var tag: String
    
    init(skin: Skin, show: Binding<Bool>) {
        self.uuid = skin.uuid
        self.image = skin.image
        self.name = skin.name
        self.price = skin.price
        self.tag = skin.tag
        self._show = show
    }
    
    var body: some View {
        ZStack {
            Color.c7984104.ignoresSafeArea(.container, edges: .bottom)
            VStack(spacing: 0) {
                header
                ScrollView(.vertical) {
                    Text("Add information about skins")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 10, leading: 45, bottom: 0, trailing: 45))
                    NewSkinImageView(imageData: $image, image: setImage(image))
                        .padding(.top, 10)
                    textFields
                        .padding(.top, 10)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Button {
                show = false
            } label: {
                Text("Cancel")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.white)
            }
            .padding(.leading, 16)
            
            Text("Skins")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.c255230143)
                .frame(maxWidth: .infinity)
            
            Button {
                if let image = image {
                    source.editSkin(Skin(uuid: uuid, image: image, name: name, price: price, tag: tag))
                }
                show = false
            } label: {
                Text("Done")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
            }
            .disabled(disabled)
            .opacity(disabled ? 0.5 : 1)
            .padding(.trailing, 16)
        }
        .frame(height: 44)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .frame(height: 58)
        .background(Color.c505686)
    }
    
    private var disabled: Bool {
        name == "" || price == "" || tag == "" || image == nil
    }
    
    private var textFields: some View {
        VStack(spacing: 0) {
            TextFieldCustom(text: $name, prefix: "Name", placeholder: "Enter name")
            Divider()
                .padding(.leading, 16)
            TextFieldCustom(text: $price, prefix: "Price", placeholder: "Enter price")
            Divider()
                .padding(.leading, 16)
            TextFieldCustom(text: $tag, prefix: "Tag", placeholder: "Enter tag")
            Divider()
                .padding(.leading, 16)
        }
        .padding(.vertical, 6)
        .background(Color.c217217217)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal, 10)
    }
    
    private func setImage(_ data: Data?) -> Image? {
        guard let data = data, let image = UIImage(data: data) else {
            return nil
        }
        return Image(uiImage: image)
    }
}

struct EditSkinView_Preview: PreviewProvider {
    
    @State static var show = true
    
    static var previews: some View {
        EditSkinView(skin: Skin(uuid: UUID(), image: Data(), name: "Name", price: "Price", tag: "tag"), show: $show)
            .environmentObject(Source())
    }
}
