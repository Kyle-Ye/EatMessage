//
//  CustomRulesSection.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import SwiftUI

struct CustomRulesSection: View {
    private let titles = ["号码允许列表","号码禁止列表","关键词允许列表","关键词禁止列表"]
    private let lists:[CustomRulesView] = [.numberAllowedList,.numberBannedList,
                                           .keywordAllowedList,.keywordBannedList]
    @State private var showRules = false
    private let rules = """
优先级从高到低分别是:

1. 号码允许列表；号码禁止列表

2. 五位数号码检查

3. 关键词允许列表；关键词禁止列表

4. 熊猫的智能模型判断
"""
    var body: some View {
        Section{
            VStack(alignment: .leading){
                Text("自定义规则")
                    .font(.headline)
                    .padding(.vertical, 5.0)
                TextInfo(text: "自定义规则会优先执行")
                    .onTapGesture{
                        showRules.toggle()
                    }
                    .alert(isPresented: $showRules){
                        Alert(
                            title: Text("规则优先级"),
                            message: Text("\(rules)"),
                            dismissButton: .cancel())
                    }
            }
            ForEach(0..<titles.count) { index in
                NavigationLink(
                    destination: lists[index],
                    label: {
                        Text(titles[index])
                            .font(.subheadline)
                    })
            }
        }
    }
}

struct CustomRuleSection_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            List{
                CustomRulesSection()
            }
            .listStyle(InsetGroupedListStyle())
        }
    }
}
