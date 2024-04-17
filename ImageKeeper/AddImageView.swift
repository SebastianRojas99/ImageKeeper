//
//  AddImageView.swift
//  ImageKeeper
//
//  Created by Sebastian Marquez Rojas on 16/04/2024.
//

import SwiftUI
import SwiftData
import PhotosUI
struct AddImageView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State var selectedPhoto:PhotosPickerItem?
    @State private var photoData:Data?
    @State private var name = ""
    var body: some View {
        VStack{
            if let photoData, let uiImage = UIImage(data: photoData){
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity,maxHeight: 300)
            
            }
            Divider()
            PhotosPicker(selection: $selectedPhoto, matching: .images, photoLibrary: .shared()){
                 Label("select image..",systemImage: "photo")
            }
            if photoData != nil{
                TextField("name",text: $name)
                    .textFieldStyle(.roundedBorder)
                Button{
                    withAnimation{
                        let newImage = PhotoModel(image: photoData ?? Data(), name: name)
                        context.insert(newImage)
                        dismiss()
                    }
                }label: {
                    Text("save image")
                }
                Button{
                    withAnimation{
                        selectedPhoto = nil
                        photoData = nil
                    }
                }label: {
                    Text("remove image")
                }.tint(Color.red)
            }
            Spacer()
            
        }.navigationTitle("add image")
            .padding(.all)
            .task(id: selectedPhoto){
                if let data = try? await selectedPhoto?.loadTransferable(type: Data.self){
                    photoData = data
                } //this code provides the image from the gallery. USE
            }
    }
}

