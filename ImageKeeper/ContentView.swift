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
                    ContentUnavailableView("Nada para mostrar...",systemImage: "photo")
                }else{
                    List{
                        ForEach(image){ item in
                            CardPhotoView(item: item )
                            Button(role:.destructive){
                                withAnimation{
                                    context.delete(item)
                                }
                            }label: {
                                Image(systemName: "trash")
                            }
                        }.listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }.shadow(color: Color.black, radius: 4, x: 3, y:3)
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .background(Color.white)
                }
                    
            }.padding(.all)
                .navigationTitle("Images Data")
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
