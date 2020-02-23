//
//  LandmarkList.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    /// 是否只展示favorite列元素
//    @State var showFavoritesOnly = true
    
    // 您可以在视图层次结构中较低的视图中使用此属性，以从较高的视图中接收数据。
    @EnvironmentObject var userData: UserData
    
    
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
            /// 若要在列表中组合静态和动态视图，或者将两个或多个不同的动态视图组合在一起，要使用 ForEach 类型，而不是将数据集合传递给 List 。
            List {
                // 使用 $ 来进行状态绑定
                Toggle(isOn:$userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                         /// NavigationLink 包装要跳转的列
                        NavigationLink(destination:LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }}
                }
            }
            // 设置导航标题
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        
        LandmarkList()
        /// 您应用此修饰符，以便视图层次结构中更深的视图可以读取通过环境传递的数据对象。
        /// 一旦将 environmentObject(_:) 修饰符应用于父级， userData 属性就会自动获取它的值。
            .environmentObject(UserData())
//            /// 通过调用 previewDevice(_:) 修饰符来改变预览设备。
//            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
        
        
        /// ForEach 以与 list 相同的方式对集合进行操作，这样我们就可以在任何可以使用子视图的地方使用它，比如 stacks ， lists ，groups 等。当数据元素像这里使用的字符串一样是简单的值类型时，我们可以使用 \.self 作为标识符的 key path 。
        /// 创建时，将键路径传递给集合元素的唯一标识属性，作为第二个参数List。
//        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
//            LandmarkList()
//                /// 具体使用那些设备进行展示
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                ///  使用 previewDisplayName(_:) 修饰符把设备名称作为 labels 添加到预览中。
//                .previewDisplayName(deviceName)
//        }
    }
}
