import SwiftUI

struct MPPartyView: View {
    var party = ["kesk", "kok", "ps", "sd", "vas", "kd", "vihr", "r", "liik"]
    
    var body: some View {
            List {
                ForEach(party, id: \.self) { party in
                    NavigationLink(destination: MPPartyDetailView(party: party)) {
                        HStack {
                            Image(party)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(party)
                                .font(.headline)
                                .textCase(.uppercase)
                        }
                    }
                }
            }
        }
    }

#Preview {
    MPPartyView()
}
