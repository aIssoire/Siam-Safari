import SwiftUI
import MapKit

struct LocationPickerView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedLocation: CLLocationCoordinate2D?

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.65107, longitude: -79.347015),
                                                   span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {  // Ensure Map is within a NavigationView
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: {
                    viewModel.checkIfLocationIsEnabled()
                })
                .gesture(
                    DragGesture().onEnded { value in
                        let location = region.center
                        self.selectedLocation = location
                    }
                )
                .overlay(
                    Image(systemName: "mappin.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.red)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                )
                .navigationTitle("Select Location")  // Set a title for clarity
                .navigationBarItems(trailing: Button("Save") {
                    if let location = selectedLocation {
                        print("Location selected: \(location)")
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        // If no location is selected yet, use the current center of the map
                        print("Saving current center location: \(region.center)")
                        selectedLocation = region.center
                        presentationMode.wrappedValue.dismiss()
                    }
                })
        }
    }
}
