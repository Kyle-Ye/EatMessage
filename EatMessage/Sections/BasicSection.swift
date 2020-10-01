//
//  BasicSection.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import SwiftUI

struct BasicSection: View {
    @State private var introToUse = false
    @State private var testMessage = false
    var body: some View {
        Section{
            TextIcon(text: "如何开启短信过滤功能", icon: "questionmark.circle.fill")
                .padding(.top)
                .onTapGesture{
                    introToUse.toggle()
                }
                .sheet(isPresented: $introToUse){
                    IntroPage()
                }
            TextIcon(text: "准确性测试", icon: "ladybug.fill")
                .onTapGesture {
                    testMessage.toggle()
                }
                .actionSheet(isPresented: $testMessage){
                    if let message = UIPasteboard.general.string{
                        do{
                            let model = try Simple_4(configuration: SimpleConfiguration())
                            let typeName = try model.prediction(text: message).typeName
                            let action = model.MLMessagePredicate(message)
                            return ActionSheet(
                                title: Text("这是\(typeName) \(action.result)"),
                                message: Text("\(message)"),
                                buttons: [
                                    .destructive(Text("提交为垃圾短信样本")),
                                    .default(Text("提交为正常短信样本")),
                                    .default(Text("提交为交易记录样本")),
                                    .cancel(Text("好"))])
                        }catch{
                            print(error.localizedDescription)
                        }
                        return ActionSheet(title: Text("模型出错，请稍后再试"), message: nil, buttons: [.default(Text("好"))])
                    }else{
                        return ActionSheet(title: Text("拷贝短信内容到剪贴板后点击此按钮，可以测试熊猫是如何判断该短信的"), message: nil, buttons: [.default(Text("好"))])
                    }
                }
            Text("熊猫从手动标注的几十万条短信中学习而成，您也可以提交新短信来教育本熊，喂养越多越聪明哦")
                .font(.footnote)
                .foregroundColor(.secondary)
                .padding(.vertical, 5.0)
        }
    }
}

struct BasicSection_Previews: PreviewProvider {
    static var previews: some View {
        List{
            BasicSection()
        }
        .listStyle(InsetGroupedListStyle())
    }
}
