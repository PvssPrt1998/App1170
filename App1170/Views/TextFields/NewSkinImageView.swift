import PhotosUI
import SwiftUI

struct NewSkinImageView: View {
   
    @Binding var imageData: Data?
    @State var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        ZStack {
            if let image = image {
                ZStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .clipped()
                }
                .frame(width: 358, height: 200)
                .clipShape(.rect(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.25), lineWidth: 1)
                )
            } else {
                VStack(spacing: 19) {
                    Image(systemName: "photo")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                    Text("Add a picture with a skin")
                        .font(.system(size: 22, weight: .regular))
                        .foregroundColor(.white)
                }
                .frame(width: 358, height: 200)
                .clipShape(.rect(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 1, dash: [4.0]))
                )
            }
        }
        .frame(width: 358, height: 200)
        .clipShape(.rect(cornerRadius: 16))
        .background(Color.c7984104)
        .onTapGesture {
            showingImagePicker = true
        }
        .onChange(of: inputImage) { _ in
            loadImage()
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
                .ignoresSafeArea()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        imageData = inputImage.pngData()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}

