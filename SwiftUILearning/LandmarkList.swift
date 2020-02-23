//
//  LandmarkList.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarkData[0])
//            LandmarkRow(landmark: landmarkData[1])
//        }
        
        /// 使用动态列表
//        List(landmarkData, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        /// 让Landmark 遵循协议Identifiable协议 可以去掉id
//        List(landmarkData) {landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        /// 嵌入导航
        NavigationView {
            List(landmarkData) { landmark in
                /// NavigationLink 包装要跳转的列
                NavigationLink(destination:LandmarkDetail(landmark: landmark)) {
                    LandmarkRow(landmark: landmark)
                }
            }
            // 设置导航标题
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
//        LandmarkList()
//            /// 通过调用 previewDevice(_:) 修饰符来改变预览设备。
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        
        
        /// ForEach 以与 list 相同的方式对集合进行操作，这样我们就可以在任何可以使用子视图的地方使用它，比如 stacks ， lists ，groups 等。当数据元素像这里使用的字符串一样是简单的值类型时，我们可以使用 \.self 作为标识符的 key path 。
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                /// 具体使用那些设备进行展示
                .previewDevice(PreviewDevice(rawValue: deviceName))
                ///  使用 previewDisplayName(_:) 修饰符把设备名称作为 labels 添加到预览中。
                .previewDisplayName(deviceName)
        }
    }
}
