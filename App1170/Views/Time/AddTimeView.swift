import SwiftUI

struct AddTimeView: View {
    
    @EnvironmentObject var source: Source
    @Binding var show: Bool
    
    @State var name: String = ""
    @State var note: String = ""
    @State var date: String = ""
    @State var time: String = ""
    @State var games: String = ""
    
    var body: some View {
        ZStack {
            Color.c7984104.ignoresSafeArea(.container, edges: .bottom)
            VStack(spacing: 0) {
                header
                ScrollView(.vertical) {
                    Text("Add a note about the latest game")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 10, leading: 45, bottom: 0, trailing: 45))
                    textFields
                        .padding(.top, 20)
                    Image("AddTimeImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 266, height: 199)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
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
            
            Text("Title")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.c255230143)
                .frame(maxWidth: .infinity)
            
            Button {
                source.saveTime(Time(uuid: UUID(), name: name, note: note, date: date, time: time, games: games))
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
        name == "" || note == "" || date == "" || time == "" || games == ""
    }
    
    private var textFields: some View {
        VStack(spacing: 0) {
            TextFieldCustom(text: $name, prefix: "Name", placeholder: "Enter name")
            Divider()
                .padding(.leading, 16)
            TextFieldCustom(text: $note, prefix: "Note", placeholder: "Enter note")
            Divider()
                .padding(.leading, 16)
            TextFieldCustom(text: $date, prefix: "Date", placeholder: "Enter date")
                .keyboardType(.numberPad)
                .onChange(of: date, perform: { newValue in
                    dateValidation(newValue)
                })
            Divider()
                .padding(.leading, 16)
            TextFieldCustom(text: $time, prefix: "Time", placeholder: "Enter time")
            Divider()
                .padding(.leading, 16)
            TextFieldCustom(text: $games, prefix: "Games", placeholder: "Enter games")
            Divider()
                .padding(.leading, 16)
        }
        .padding(.vertical, 6)
        .background(Color.c217217217)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.horizontal, 10)
    }
    
    private func dateValidation(_ newValue: String) {
        let filtered = newValue.filter { Set("0123456789").contains($0) }
        
        if filtered != "" {
            var filterIterable = filtered.makeIterator()
            var index = 0
            var value = ""
            while let c = filterIterable.next() {
                if index == 0 || index == 1 || index == 3 || index == 5 || index == 6 || index == 7 {
                    value = value + "\(c)"
                }
                if index == 2 || index == 4 {
                    value = value + ".\(c)"
                }
                index += 1
            }
            date = value
        } else  {
            date = ""
        }
    }
}

struct AddTimeView_Preview: PreviewProvider {
    
    @State static var show = true
    
    static var previews: some View {
        AddTimeView(show: $show)
            .environmentObject(Source())
    }
}
