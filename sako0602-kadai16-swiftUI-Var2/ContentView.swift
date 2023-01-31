//
//  ContentView.swift
//  sako0602-kadai16-swiftUI-Var2
//
//  Created by sako0602 on 2023/01/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    @State private var fruitArray = [
        FruitsData(name: "りんご", isChecked: false),
        FruitsData(name: "みかん", isChecked: true),
        FruitsData(name: "バナナ", isChecked: false),
        FruitsData(name: "パイナップル", isChecked: true),
    ]
    
    var body: some View {
        NavigationStack {
            List (fruitArray.indices, id: \.self) { index in
                FruitRowView(fruit: fruitArray[index])
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isPresented = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .padding()
                }
            }
            .sheet(isPresented: $isPresented) {
                FruitsAddView(
                    save: { name in
                        fruitArray.append(FruitsData(name: name, isChecked: false))
                        isPresented = false
                    } ,cancel: {
                        isPresented = false
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
