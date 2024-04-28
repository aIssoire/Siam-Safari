import SwiftUI

struct ContentView: View {
    init() {
            // Configuration de l'arrière-plan de la UITabBar
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    var body: some View {
        TabView {
            MapView()
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

