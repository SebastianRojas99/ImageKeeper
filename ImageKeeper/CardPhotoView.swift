//
//  CardPhotoView.swift
//  ImageKeeper
//
//  Created by Sebastian Marquez Rojas on 16/04/2024.
//

import SwiftUI

struct CardPhotoView: View {
    var item:PhotoModel
    var body: some View {
        if let photoData = item.image, let uiImage = UIImage(data:photoData){
            VStack{
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Text(item.name)
                    .font(.title)
                    .bold()
            }.padding(.all)
                .background(Color(uiColor: .systemGroupedBackground))
        }
    }
}


