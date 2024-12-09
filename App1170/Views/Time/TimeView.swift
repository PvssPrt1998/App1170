import SwiftUI

struct TimeView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var source: Source
    @State var showAddView = false
    
    var body: some View {
        ZStack {
            Color.c505686.ignoresSafeArea()
            Color.c7984104
            VStack(spacing: 0) {
                header
                if source.times.isEmpty {
                    Text("Add a record of your in-game time")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                        .padding(.horizontal, 35)
                } else {
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 14) {
                            ForEach(source.times, id: \.self) { time in
                                TimeCard(time: time)
                            }
                        }
                        .padding(EdgeInsets(top: 20, leading: 25, bottom: 70, trailing: 25))
                    }
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            
            Button {
                showAddView = true
            } label: {
                Image(systemName: "plus.circle")
                    .font(.system(size: 40, weight: .regular))
                    .foregroundColor(.c576391)
                    .padding(4)
                    .background(Color.c255230143)
                    .clipShape(.circle)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 18, trailing: 20))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .sheet(isPresented: $showAddView) {
            AddTimeView(show: $showAddView)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    private var header: some View {
        VStack {
            Text("Time")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.c255230143)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .background(Color.c505686)
    }
}

#Preview {
    TimeView()
        .environmentObject(Source())
}
