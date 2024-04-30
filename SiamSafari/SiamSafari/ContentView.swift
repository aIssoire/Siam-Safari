import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    init() {
            // Configuration de l'arrière-plan de la UITabBar
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    var body: some View {
        TabView {
            MapView()
                .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
                .tabItem {
                    Image(systemName: "map")
                }
            
            AddView()
                .tabItem {
                    Image(systemName: "plus.circle")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
        }
        .background(Color.white)
        .accentColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

