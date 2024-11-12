import SwiftUI

struct PreferencesView: View {
    @Binding var mps: [MP]

    var body: some View {
        VStack {
            Text("Favorite Parties")
                .font(.headline)
            List {
                let favoriteParties = Set(mps.filter { $0.isFavoriteMember }.map { $0.party })
                ForEach(Array(favoriteParties), id: \.self) { party in
                    Text(party.uppercased())
                }
            }

            Text("Favorite Members")
                .font(.headline)
            List {
                ForEach(mps.filter { $0.isFavoriteMember }) { mp in
                    Text("\(mp.firstName) \(mp.lastName)")
                }
            }
        }
        .padding()
    }
}
