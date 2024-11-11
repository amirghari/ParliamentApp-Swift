import SwiftUI

struct MPPartyView: View {
    @Binding var mps: [MP]
    var partyList = ["kesk", "kok", "ps", "sd", "vas", "kd", "vihr", "r", "liik"]

    var body: some View {
        List {
            ForEach(partyList, id: \.self) { party in
                NavigationLink(destination: MPPartyDetailView(mps: $mps, party: party)) {
                    HStack {
                        Image(party)
                        Text(party.uppercased())
                    }
                }
            }
        }
    }
}
