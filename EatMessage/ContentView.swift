//
//  ContentView.swift
//  EatSpam
//
//  Created by 叶絮雷 on 2020/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                List{
                    BasicSection()
                    FilterOptionsSection()
                    CustomRulesSection()
                    AboutSection()
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("熊猫吃短信")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
