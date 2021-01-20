//
//  NewsList.swift
//  adsa
//
//  Created by User19 on 2021/1/5.
//

import SwiftUI

struct NewsList: View {
    @State public var newss = [News]()
    @StateObject var weatherViewmodel=WeatherList1()
    func fetchNews(){
        let urlStr = "https://data.moi.gov.tw/MoiOD/System/DownloadFile.aspx?DATA=36384FA8-FACF-432E-BB5B-5F015E7BC1BE"
        if let url = URL(string: urlStr) {
            
            URLSession.shared.dataTask(with: url){ (data, response, error)in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data,
                   let Results = try? decoder.decode([News].self, from:data){
                    newss = Results
                    //print(newss)
                } else {
                    print("error")
                }
            }.resume()
            
        }
    }
    
    var body: some View {
        VStack{
            Text("最新路況廣播")
                .font(.largeTitle)
            /*HStack {
                Text("區域")
                Text("路線")
                Text("發生時間")
            }*/
             
            NavigationView{
                
                List(newss.indices, id:\.self, rowContent: { (index) in
                    
                    //newsRow(news:newss[index])
                    NavigationLink(destination: newsDetail(news: newss[index]),
                                   label: {
                                    newsRow(news: newss[index])
                                   })
                })
                .navigationTitle("區域       路線       發生時間")
            }
            //.navigationBarTitle("aaa",displayMode: .inline)
            
        }
        .onAppear(perform:{
            fetchNews()
            weatherViewmodel.fetchWeathers(city: "基隆市")
        })
    }
    
    
}
