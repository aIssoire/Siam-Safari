import SwiftUI

struct AddView: View {
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selection: String = "Trash Bin"
    @State private var showingImagePicker = false
    @State private var images: [UIImage] = []

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Information")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Section(header: Text("Type")) {
                    Picker("Choose an option", selection: $selection) {
                        Text("Trash Bin").tag("Trash Bin")
                        Text("Toilet").tag("Toilet")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Button(action: {
                        // Add logic to choose location on the map here
                    }) {
                        Text("Choose a location on the map")
                    }
                }

                Section {
                    Button(action: {
                        self.showingImagePicker = true
                    }) {
                        Text("Add Photos")
                    }

                    if !images.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(images.indices, id: \.self) { index in
                                    ZStack(alignment: .topTrailing) {
                                        Image(uiImage: images[index])
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .clipShape(Rectangle())
                                            .overlay(Rectangle().stroke(Color.blue, lineWidth: 2))
                                        
                                        Button(action: {
                                            images.remove(at: index)
                                        }) {
                                            Image(systemName: "xmark.circle.fill")
                                                .padding(2)
                                                .foregroundColor(.white)
                                                .background(Color.black.opacity(0.6))
                                                .clipShape(Circle())
                                        }
                                        .padding(5)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Add a Pin")
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(images: $images)
        }
    }
}



import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var images: [UIImage]

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0  // 0 permet une sélection illimitée
        config.filter = .images    // Seulement des images

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        // Pas de mise à jour nécessaire ici
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.presentationMode.wrappedValue.dismiss()
            for result in results {
                result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                    if let image = object as? UIImage {
                        DispatchQueue.main.async {
                            self.parent.images.append(image)
                        }
                    }
                }
            }
        }
    }
}
