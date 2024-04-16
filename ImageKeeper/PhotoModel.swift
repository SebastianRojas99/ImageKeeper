//
//  PhotoModel.swift
//  ImageKeeper
//
//  Created by Sebastian Marquez Rojas on 15/04/2024.
//

import Foundation
import SwiftData

@Model
final class PhotoModel{
    @Attribute(.externalStorage) var image:Data?
    var name:String
    
    init(image: Data? = nil, name: String) {
        self.image = image
        self.name = name
    }
    
    
}
