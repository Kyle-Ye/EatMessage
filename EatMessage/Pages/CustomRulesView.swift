//
//  CustomRulesView.swift
//  EatMessage
//
//  Created by 叶絮雷 on 2020/10/4.
//

import SwiftUI

struct CustomRulesView: View {
    let title:String
    @State var rulesList:[String] = []
    var body: some View {
        VStack {
            HStack{
                Text("规则列表")
                    .foregroundColor(.secondary)
                    .padding(8.0)
                Spacer()
            }
            .background(Color(.systemGray4))
            List{
                ForEach(rulesList,id:\.self){
                    Text($0)
                }
            }
            Spacer()
            HStack{
                Image(systemName: "info.circle")
                Text("自定义规则只对新收到的短信生效")
                Spacer()
            }
            .foregroundColor(.secondary)
            .padding(10)
            .background(Color(.systemGray4))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
            HStack{
                Text("常见规则")
                    .foregroundColor(.secondary)
                    .padding(8.0)
                Spacer()
            }
            .background(Color(.systemGray4))
            List{
                ForEach(rulesList,id:\.self){
                    Text($0)
                }
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            let ac = UIAlertController(title: "请输入号码", message: nil, preferredStyle: .alert)
            ac.addTextField()
            ac.addAction(.init(title: "取消", style: .cancel))
            ac.addAction(.init(title: "确定", style: .default, handler: { _ in
                if let text = ac.textFields?[0].text{
                    rulesList.append(text)
                }
            }))
            UIApplication.shared.windows[0].rootViewController?.present(
                ac,
                animated: true)
        }, label: {
            Text("添加").font(.body)
        }))
    }
    static let numberAllowedList = CustomRulesView(title: "号码允许列表")
    static let numberBannedList = CustomRulesView(title: "号码禁止列表")
    static let keywordAllowedList = CustomRulesView(title: "关键词允许列表")
    static let keywordBannedList = CustomRulesView(title: "关键词禁止列表")
}

struct CustomRulesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CustomRulesView.numberAllowedList
        }
    }
}
