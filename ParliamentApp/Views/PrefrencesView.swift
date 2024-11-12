import SwiftUI

struct PreferencesView: View {
    @ObservedObject var mpModel: MPModel

    var body: some View {
        VStack {
            Text("Favorite Parties")
                .font(.headline)
            List {
                ForEach(mpModel.favoriteParties, id: \.self) { party in
                    Text(party.uppercased())
                }
            }

            Text("Favorite Members")
                .font(.headline)
            List {
                ForEach(mpModel.favoriteMembers) { mp in
                    Text("\(mp.firstName) \(mp.lastName)")
                }
            }
        }
        .padding()
    }
}
