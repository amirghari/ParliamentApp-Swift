import SwiftUI

struct MPPartyDetailView: View {
    @Binding var mps: [MP]
    var party: String

    var filteredMps: [Binding<MP>] {
        mps.enumerated().compactMap { index, mp in
            mp.party == party ? $mps[index] : nil
        }
    }

    var body: some View {
        List {
            ForEach(filteredMps, id: \.id) { $mp in
                NavigationLink(destination: MPDetailView(mp: $mp)) {
                    MPRowView(mp: mp)
                }
            }
        }
        .navigationTitle("\(party.uppercased()) Members")
    }
}
