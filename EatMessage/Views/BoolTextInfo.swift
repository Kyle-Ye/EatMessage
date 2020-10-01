//
//  BoolTextInfo.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/26.
//

import SwiftUI

struct BoolTextInfo: View{
    let text:String
    var footer:String?
    var page: ExamplePage?
    @Binding var chosen:Bool
    @State private var infoShow = false
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle\(chosen ? ".fill" : "")")
                .foregroundColor(chosen ? .accentColor : .secondary)
            Text("\(text)")
            Spacer()
            if let footer = footer{
                Text(footer)
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            if let page = page{
                Image(systemName: "info.circle")
                    .foregroundColor(.accentColor)
                    .onTapGesture{
                        infoShow.toggle()
                    }
                    .sheet(isPresented: $infoShow){
                        page
                    }
            }
        }
        .font(.subheadline)
        .onTapGesture{
            chosen.toggle()
        }

    }
}

struct BoolTextInfo_Previews: PreviewProvider {

    static var b = true
    static var previews: some View {
        List{
            BoolTextInfo(text: "过滤广告、推销等垃圾广告",page: ExamplePage(),chosen: .constant(true))
            BoolTextInfo(text: "过滤公益和不重要的短信",page: ExamplePage(),chosen: .constant(true))
            BoolTextInfo(text: "不过滤五位数号码", footer: "银行商等公共单位",chosen: .init(
                            get: { b },
                            set: { b = $0 }
            ))
        }
        .listStyle(InsetGroupedListStyle())
    }
}
