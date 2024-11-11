import SwiftUI

struct ContentView: View {
    @State private var mps = DataLoader.loadMps()

    var body: some View {
        NavigationView {
            MPPartyView()
                .navigationTitle("Parties")
                .toolbar {
                    ToolbarItem(placement: .status) {
                        NavigationLink(destination: PrefrencesView()) {
                            Text("Preferences")
                            Label("Preferences", systemImage: "gear")
                                
                        }
                    }
                }
            }
        }
    }
