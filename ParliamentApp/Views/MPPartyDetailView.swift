import SwiftUI

struct MPPartyDetailView: View {
    @Binding var mps: [MP]
    var party: String

    var filteredIndices: [Int] {
        mps.indices.filter { mps[$0].party == party }
    }

    var body: some View {
        List {
            ForEach(filteredIndices, id: \.self) { index in
                NavigationLink(destination: MPDetailView(mp: $mps[index], mps: $mps)) {
                    MPRowView(mp: mps[index])
                }
            }
        }
        .navigationTitle("\(party.uppercased()) Members")
    }
}
