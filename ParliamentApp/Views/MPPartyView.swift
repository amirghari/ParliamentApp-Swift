import SwiftUI

struct MPPartyView: View {
    @ObservedObject var mpModel: MPModel

    var partyList = ["kesk", "kok", "ps", "sd", "vas", "kd", "vihr", "r", "liik"]

    var body: some View {
        List {
            ForEach(partyList, id: \.self) { party in
                let filteredMps = mpModel.mps.filter { $0.party == party }
                NavigationLink(destination: MPPartyDetailView(mps: filteredMps, party: party, mpModel: mpModel)) {
                    HStack {
                        Image(party)
                        Text(party.uppercased())
                    }
                }
            }
        }
    }
}
