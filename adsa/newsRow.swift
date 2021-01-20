//
//  newsRow.swift
//  adsa
//
//  Created by User19 on 2021/1/5.
//

import SwiftUI

struct newsRow: View {
    var news:News
    var body: some View {
        let none="未知"
        HStack{
            
            Text(news.region ?? none)
            Spacer()
            if(news.areaNm == "")
            {
                Image(systemName: "questionmark")
            }
            Text(news.areaNm ?? none)
            Spacer()
            let cutTime = String(news.happentime.prefix(8))//字串擷取
            Text(cutTime)
        }
    
    }
}
