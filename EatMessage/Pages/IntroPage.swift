//
//  IntroPage.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/27.
//

import SwiftUI

struct IntroPage: View {
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        VStack {
            Text("如何使用")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Section{
                // TODO PS to remove something
                Image("panda")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color("icon_gray"))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                (Text("打开「设置 → 信息 → 未知与过滤信息」，在「短信过滤」一栏中选中")+Text("「熊猫吃短信」").bold())
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                HStack(spacing: 15.0){
                    Image(systemName: "gear")
                        .padding(10)
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color("icon_gray")))
                    Text("前往设置")
                        .foregroundColor(.accentColor)
                        .onTapGesture{
                            UIApplication.shared.open(URL(string:"App-Prefs:root=General")!)
                        }
                }.font(.callout)

            }
            .padding(.vertical)
            Spacer()
            
            Text("已过滤短信会归类到多个标签里")
                .fontWeight(.medium)
                
            List{
                Section(header:Text("由\"熊猫吃短信\"过滤")){
                    NavigationLink(
                        destination: EmptyView(),
                        label: {
                            Image(systemName: "arrow.left.arrow.right")
                                .foregroundColor(.blue)
                            Text("交易信息")
                        })
                    NavigationLink(
                        destination: EmptyView(),
                        label: {
                            Image(systemName: "megaphone")
                                .foregroundColor(.blue)
                            Text("推广信息")
                        })
                }
                Section{
                    NavigationLink(
                        destination: Text("Destination"),
                        label: {
                            Image(systemName: "xmark.bin")
                                .foregroundColor(.blue)
                            Text("垃圾短信")
                        })
                }
            }
            .listStyle(InsetGroupedListStyle())
            .frame(height:220)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            (Text("小提示：iMessage 信息无法过滤，建议您在同一个设置里面开启")+Text("「过滤未知发件人」").bold()+Text("选项."))
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundColor(.secondary)
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Spacer()
                Text("开始使用")
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            })
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
        }
        .padding(.horizontal,30)
        .padding(.top, 30.0)
        .padding(.bottom,30.0)
    }
}

struct IntroPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Text("")
                .sheet(isPresented: .constant(true)){
                    IntroPage()
            }
            Text("")
                .sheet(isPresented: .constant(true)){
                    IntroPage()
                        .preferredColorScheme(.dark)
                }
        }
        
    }
}
