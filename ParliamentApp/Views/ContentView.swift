import SwiftUI

struct ContentView: View {
    @State private var mps: [MP] = []

    var body: some View {
        NavigationView {
            MPPartyView(mps: $mps)
                .navigationTitle("Parties")
                .toolbar {
                    ToolbarItem(placement: .status) {
                        NavigationLink(destination: PrefrencesView(mps: $mps)) {
                            Text("Preferences")
                            Label("Preferences", systemImage: "gear")
                                .font(.subheadline)
                            }
                    }
            }
                .onAppear {
                    DataLoader.loadMps { fetchedMps in
                        if let fetchedMps = fetchedMps {
                            DispatchQueue.main.async {
                                self.mps = fetchedMps
                            }
                        }
                    }
                }
        }
    }
}
