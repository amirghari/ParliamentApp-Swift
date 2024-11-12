import SwiftUI

struct MPPartyDetailView: View {
    var mps: [MP]
    var party: String
    @ObservedObject var mpModel: MPModel

    var body: some View {
        List {
            ForEach(mps) { mp in
                NavigationLink(destination: MPDetailView(mp: mp, mpModel: mpModel)) {
                    MPRowView(mp: mp)
                }
            }
        }
        .navigationTitle("\(party.uppercased()) Members")
    }
}
