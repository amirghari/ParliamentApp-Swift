import SwiftUI

struct MPPartyDetailView: View {
    var mps: [MP]
    var party: String

    var body: some View {
        List {
            ForEach(mps.filter { $0.party == party }) { mp in
                            NavigationLink(destination: MPDetailView(mp: mp)) {
                                MPRowView(mp: mp)
                            }
                        }
        }
        .navigationTitle("\(party.uppercased()) Members")
    }
}
