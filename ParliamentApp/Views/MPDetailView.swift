import SwiftUI

struct MPDetailView: View {
    @Binding var mp: MP

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image("account")
                .resizable()
                .frame(width: 250, height: 250)
            Text("\(mp.firstName) \(mp.lastName)")
                .font(.largeTitle)
                .padding(.bottom)
            
            Text("Party: \(mp.party)")
            Text("Seat Number: \(mp.seatNumber)")
            Text("Born Year: \(mp.bornYear)")
            Text("Constituency: \(mp.constituency)")
            
            Button(action: {
                mp.isFavoriteMember.toggle()
            }) {
                Image(systemName: mp.isFavoriteMember ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .font(.largeTitle)
            }
            
            Spacer()
        }
    }
}
