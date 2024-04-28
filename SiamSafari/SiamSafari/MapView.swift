import SwiftUI
import MapKit

struct MapView: View {
    // Définis la région initiale de la carte (ici Paris, par exemple)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), // Coordonnées de Paris
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )

    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all) // Fait en sorte que la carte remplisse tout l'écran
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

