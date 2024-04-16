//
//  ContentView.swift
//  ImageKeeper
//
//  Created by Sebastian Marquez Rojas on 15/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var image:[PhotoModel]
    @State var show = false
    
    var body: some View {
        NavigationStack{
            VStack{
                if image.isEmpty{
                    ContentUnavailableView("Nada para mostrar",systemImage: "photo")
                }else{
                    //
                }
            }.padding(.all)
                .navigationTitle("image data ")
                .toolbar{
                    ToolbarItem{
                        Button{
                            show.toggle()
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView().modelContainer(for:PhotoModel.self, inMemory: true)
}
