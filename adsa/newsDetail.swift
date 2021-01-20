//
//  newsDetail.swift
//  adsa
//
//  Created by User19 on 2021/1/5.
//

import SwiftUI
import MapKit

struct newsDetail: View {
    @State private var lat = 120.1018
    @State private var lon = 23.2632
    var news:News
    var body: some View {
        VStack{
            HStack {
                Text("類別：")
                    .fontWeight(.heavy)
                    .padding(.leading)
                if(news.roadtype=="")
                {
                    Image(systemName: "questionmark")
                }else
                {
                    Text(news.roadtype ?? "")
                }
                //Spacer()
                Text("方向：")
                    .fontWeight(.heavy)
                    .padding(.leading)
                    
                if(news.direction=="")
                {
                    Image(systemName: "questionmark")
                        .padding(.trailing)
                }
                else
                {
                    Text(news.direction ?? "")
                        .padding(.trailing)
                }
            }
            .padding(.bottom)//h
            
            VStack{
            Text("詳情：")
                .font(.subheadline)
                .fontWeight(.heavy)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            Text(news.comment)
                .multilineTextAlignment(.leading)
                //MapView(x1:news.x1, y1:news.y1)
                MapView(coordinate: CLLocationCoordinate2D(latitude: (news.y1 as NSString).doubleValue , longitude: (news.x1 as NSString).doubleValue ))
        }
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

