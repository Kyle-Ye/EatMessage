//
//  TextIcon.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/26.
//

import SwiftUI

struct TextIcon: View{
    let text:String
    let icon:String
    var body: some View{
        HStack{
            Text("\(text)")
                .lineLimit(1)
            Spacer()
            Image(systemName: icon)
        }
        .font(.subheadline)
        .foregroundColor(.accentColor)
    }
}

struct TextIconLink_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            List{
                TextIcon(text: "如何开启短信过滤功能", icon: "questionmark.circle.fill")
                TextIcon(text: "准确性测试", icon: "ladybug.fill")
                TextIcon(text: "如何开启短信过滤功能如何开启短信过滤功能如何开启短信过滤功能如何开启短信过滤功能如何开启短信过滤功能如何开启短信过滤功能如何开启短信过滤功能", icon: "ladybug.fill")
            }
            .listStyle(InsetGroupedListStyle())

            List{
                TextIcon(text: "如何开启短信过滤功能", icon: "questionmark.circle.fill")
                TextIcon(text: "准确性测试", icon: "ladybug.fill")
            }
            .listStyle(InsetGroupedListStyle())
            .preferredColorScheme(.dark)
        }
    }
}
