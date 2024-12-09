import SwiftUI

struct Splash: View {
    
    @EnvironmentObject var source: Source
    @State var value: Double = 0
    @Binding var screen: Screen
    
    var body: some View {
        ZStack {
            Color.c3743100
                .overlay(Color.black.opacity(0.3))
                .ignoresSafeArea()
            Color.c3743100
                .ignoresSafeArea(.container, edges: .bottom)
            
            Image("SplashLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 219, height: 219)
            
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(Color.white, lineWidth: 4)
                .frame(width: 82, height: 82)
                .rotationEffect(.degrees(value))
                .padding(.top, UIScreen.main.bounds.height * 0.65)
        }
        .onAppear {
            stroke()
            source.load {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    screen = .main
                }
            }
        }
    }
    
    func stroke() {
        withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
            value = 360
        }
    }
}

struct Splash_Preview: PreviewProvider {
    
    @State static var splash: Screen = .splash
    
    static var previews: some View {
        Splash(screen: $splash)
            .environmentObject(Source())
    }
}
