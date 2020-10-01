//
//  AboutSection.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import SwiftUI

struct AboutSection: View {
    var body: some View {
        Section{
            
            VStack(alignment: .leading) {
                Text("关于")
                    .font(.headline)
                    .padding(.vertical, 10)
                IconTextLink(icon: "questionmark.circle.fill", text: "帮助和常见问题")
            }
            IconTextLink(icon: "text.book.closed.fill", text: "隐私政策")
            IconTextLink(icon: "square.and.arrow.up.fill", text: "把本熊介绍给朋友")
            IconTextLink(icon: "appletv.fill", text: "给本熊评分", link: "")
            IconTextLink(icon: "hammer.fill", text: "作者Baye", footer: "有趣的独立开发者",link: "")
        }
    }
}

struct AboutSection_Previews: PreviewProvider {
    static var previews: some View {
        List{
            AboutSection()
        }
        .listStyle(InsetGroupedListStyle())
    }
}
