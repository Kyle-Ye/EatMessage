//
//  IconTextLink.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import SwiftUI

struct IconTextLink: View {
    let icon:String
    let text:String
    var footer:String?
    var link:String?
    var body: some View {
        HStack{
            Image(systemName: icon)
                .foregroundColor(.accentColor)
            Text("\(text)")
                .lineLimit(1)
            Spacer()
            if let footer = footer{
                Text(footer)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            if link != nil{
                Image(systemName: "safari.fill")
                    .foregroundColor(.secondary)
            }else{
                Text("...")
                    .foregroundColor(.secondary)
            }
        }
        .font(.subheadline)
    }
}

struct IconTextLink_Previews: PreviewProvider {
    static var previews: some View {
        List{
            IconTextLink(icon: "questionmark.circle.fill", text: "帮助和常见问题")
            IconTextLink(icon: "text.book.closed.fill", text: "隐私政策")
            IconTextLink(icon: "square.and.arrow.up.fill", text: "把本熊介绍给朋友")
            IconTextLink(icon: "appletv.fill", text: "给本熊评分", link: "")
            IconTextLink(icon: "hammer.fill", text: "作者Baye", footer: "有趣的独立开发者",link: "")
        }
        .listRowInsets(.init(top: 20, leading: 50, bottom: 0, trailing: 0))
        .listStyle(InsetGroupedListStyle())
    }
}
