import SwiftUI

struct MPPartyView: View {
    @Binding var mps: [MP]
    var partyList = ["kesk", "kok", "ps", "sd", "vas", "kd", "vihr", "r", "liik"]

    var body: some View {
        List {
            ForEach(partyList, id: \.self) { party in
                let filteredMps = mps.filter { $0.party == party }
                NavigationLink(destination: MPPartyDetailView(mps: filteredMps, party: party)) {
                    HStack {
                        Image(party)
                        Text(party.uppercased())
                    }
                }
            }
        }
    }
}
