import SwiftUI

struct TimeCard: View {
    
    @EnvironmentObject var source: Source
    let time: Time
    
    var body: some View {
        VStack(spacing: 0) {
            Text(time.name)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.c313771)
                .padding(.horizontal, 15)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: 34)
                .background(Color.c255230143)
                .overlay(
                    Button {
                        source.removeTime(time)
                    } label: {
                        Image(systemName: "trash.fill")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundColor(.white)
                            .frame(width: 74)
                            .frame(maxHeight: .infinity)
                            .background(Color.c2555948)
                    }
                    ,alignment: .trailing
                )
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(time.time)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.black)
                    Text(time.games)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .trailing, spacing: 4) {
                    Text(time.note)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.black)
                    Text(time.date)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(EdgeInsets(top: 12, leading: 15, bottom: 12, trailing: 15))
        }
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    TimeCard(time: Time(uuid: UUID(), name: "name", note: "note", date: "01.01.1000", time: "time", games: "games"))
        .environmentObject(Source())
        .padding()
}
