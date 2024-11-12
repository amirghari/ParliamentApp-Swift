import SwiftUI

struct ContentView: View {
    @StateObject private var mpModel = MPModel()

    var body: some View {
        NavigationView {
            MPPartyView(mpModel: mpModel)
                .navigationTitle("Parties")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: PreferencesView(mpModel: mpModel)) {
                            Label("Preferences", systemImage: "gear")
                                .font(.subheadline)
                        }
                    }
                }
        }
    }
}
