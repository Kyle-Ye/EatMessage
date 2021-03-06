//
//  FilterOptionsSection.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import SwiftUI

struct FilterOptionsSection: View {
    @AppStorage(s_junk,store:UserDefaults.init(suiteName: suiteName))
    var filterJunk = true
    @AppStorage(s_unimportant,store:UserDefaults.init(suiteName: suiteName))
    var filterUnimportant = true
    @AppStorage(s_digitAllow,store:UserDefaults.init(suiteName: suiteName))
    var allowFiveDigit = true
    var body: some View {
        Section{
            VStack(alignment: .leading){
                Text("过滤选项")
                    .font(.headline)
                    .padding(.vertical, 5.0)
                Text("选择您希望过滤的短信类别")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5.0)
            }
            BoolTextInfo(text: "过滤广告、推销等垃圾广告",page: ExamplePage.junk,chosen: $filterJunk)
            BoolTextInfo(text: "过滤公益和不重要的短信",page:ExamplePage.unimportant,chosen: $filterUnimportant)
            BoolTextInfo(text: "不过滤五位数号码", footer: "银行运营商等公共单位",chosen: $allowFiveDigit)
        }
    }
}

struct FilterOptionSection_Previews: PreviewProvider {
    static var previews: some View {
        List{
            FilterOptionsSection()
        }
        .listStyle(InsetGroupedListStyle())
    }
}
