import SwiftUI

struct FavoritesView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var source: Source
    @State var selection: Int = 0
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.white.opacity(0.12))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        ZStack {
            Color.c505686.ignoresSafeArea()
            Color.c7984104
            VStack(spacing: 0) {
                header
                segmented
                segmentedContent
                    .padding(.top, 25)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    private var header: some View {
        VStack {
            Text("Favorites")
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
        .background(Color.c505686)
    }
    
    private var segmented: some View {
        Picker("", selection: $selection) {
            Text("Guides").tag(0)
            Text("Subtleties").tag(1)
            Text("Mistake").tag(2)
        }
        .pickerStyle(.segmented)
        .padding(EdgeInsets(top: 12, leading: 15, bottom: 0, trailing: 15))
    }
    
    @ViewBuilder private var segmentedContent: some View {
        if selection == 0 {
            FavoriteGuidesView()
        } else if selection == 1 {
            FavoriteSubtletiesView()
        } else {
            FavoriteMistakesView()
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(Source())
}
