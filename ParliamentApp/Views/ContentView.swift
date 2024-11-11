import SwiftUI

struct ContentView: View {
    @StateObject private var dataLoader = DataLoader()

    var body: some View {
        NavigationView {
            MPPartyView(mps: $dataLoader.mps)
                .navigationTitle("Parties")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: PreferencesView(mps: $dataLoader.mps)) {
                            Text("Preferences")
                            Label("Preferences", systemImage: "gear")
                                .font(.subheadline)
                        }
                    }
                }
                .onAppear {
                    dataLoader.loadMps()
                }
        }
    }
}
