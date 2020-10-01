//
//  TextInfo.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import SwiftUI

struct TextInfo: View {
    let text:String
    var body: some View {
        HStack{
            Text("\(text)")
                .foregroundColor(.secondary)
            Spacer()
            Image(systemName: "info.circle")
                    .foregroundColor(.accentColor)
        }
        .font(.subheadline)
    }
}

struct TextInfo_Previews: PreviewProvider {
    static var previews: some View {
        List{
            TextInfo(text: "自定义规则会优先执行")
        }
        .listStyle(InsetGroupedListStyle())
    }
}
