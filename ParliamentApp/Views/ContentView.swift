import SwiftUI

struct ContentView: View {
    @State private var mps: [MP] = []

    var body: some View {
        NavigationView {
            MPPartyView(mps: $mps)
                .navigationTitle("Parties")
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
