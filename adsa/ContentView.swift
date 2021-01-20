//
//  ContentView.swift
//  adsa
//
//  Created by User19 on 2021/1/5.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView{
            NewsList()
                .tabItem {
                    Image(systemName: "car.fill")
                    Text("路況資訊")
                }
            weatherlist()
                .tabItem {
                    Image(systemName: "cloud.fill")
                    Text("天氣資訊")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
