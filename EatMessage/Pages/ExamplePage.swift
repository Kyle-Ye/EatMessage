//
//  ExamplePage.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/28.
//

import SwiftUI

struct ExamplePage: View {
    @Environment(\.presentationMode) private var presentationMode
    @State var showAlert = false
    @State var testMessage = ""
    let titile:String
    let description:String
    let messages:[String]
    var body: some View {
        VStack{
            HStack{
                Text(titile)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .onTapGesture{
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            List{
                VStack(alignment: .leading){
                    Text(description)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    Text("短信示例")
                        .font(.headline)
                        .padding(.bottom, 5.0)
                    Text("点击短信内容可以测试")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                ForEach(messages,id:\.self){ message in
                    Section{
                        Text(message)
                            .padding()
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .onTapGesture{
                                showAlert.toggle()
                                testMessage = message
                            }
                    }.alert(isPresented: $showAlert){
                        do{
                            let model = try Simple_4(configuration: SimpleConfiguration())
                            let typeName = try model.prediction(text: message).typeName
                            let action = model.MLMessagePredicate(message)
                            return Alert(
                                title: Text("这是\(typeName) \(action.result)"),
                                message: Text("\(testMessage)"),
                                dismissButton: .default(Text("好")))
                        }catch{
                            print(error.localizedDescription)
                        }
                        return Alert(title: Text("模型出错，请稍后再试"), message: nil, dismissButton: .cancel())
                    }
                }
            }.listStyle(PlainListStyle())
            
        }
        .padding()
        
    }
    static let junk = ExamplePage(titile: "广告及垃圾短信", description: "包含常见的电商推广、垃圾广告、色情信息等", messages: ["【哔哩哔哩】亲爱的用户，现参与《大会员调研问卷》即送3天大会员时长，赶快立即填写吧>> https://b23.tv/fGEnQ4 退订回T","【好礼大回馈】尊敬的客户，恭喜您获得一次免费开礼包机会，100%中奖！流量券、话费券一键开启！点击链接立即参与：https://10086.cn/d/7BZnmm 专享活动，转发无效。【中国移动】"])
    static let unimportant = ExamplePage(titile: "不重要的短信", description: "包含公益短信、天气预报、不重要的通知、公共提醒等", messages: ["【市卫生健康委提示】：一日三餐要安排合理，定时定量、杜绝浪费，多吃蔬菜、水果和薯类，注意荤素、粗细搭配，少吃过油、过甜、过咸的食物；提倡使用公勺、公筷，避免参加聚集性活动，保持一定社交距离；酒店住宿要多开窗、常通风，合理安排作息，适量运动，避免暴饮、暴食和熬夜。","尊敬的客户：为减少小额消费短信对您的打扰，我行对消费提醒服务进行优化升级。即日起，我行将根据前期公告停发300元以下人民币交易短信提醒通知。您可关注“中国银行信用卡”官方微信并绑定信用卡，享受任意金额交易的微信通知服务。祝您用卡愉快！退订回复TD#4901【中国银行】"])
}

struct ExamplePage_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
            .sheet(isPresented: .constant(true)){
                ExamplePage.junk
            }
    }
}
