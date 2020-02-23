//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//

import SwiftUI
/// 默认情况下，SwiftUI视图文件声明两个结构。第一种结构符合View协议，并描述了视图的内容和布局。第二个结构声明该视图的预览。
/// 在画布中，单击“继续”（resume）以显示预览。
/// 修改视图展示两种方式： 代码  和 代码点击展示检查器/右边的检查器(inspector)


/// 第一种结构符合View协议，并描述了视图的内容和布局。
struct LandmarkDetail: View {
    
    var landmark: Landmark
    
    var body: some View {
        
        VStack {

            /// 要允许地图内容扩展到屏幕的顶部边缘，请将修改器添加到地图视图。edgesIgnoringSafeArea(.top)

            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 300)
            
            /// 图像垂直偏移-130点，并从视图底部填充-130点。
            CircleImage(image: landmark.image)
                .offset( y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                HStack(alignment: .top) {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer() // 添加间距
                    Text(landmark.state)
                        .font(.subheadline)
                }
                
            }
                /// VStack 左右添加间距
            .padding()
            

            /// 在外部底部添加一个垫片，将VStack内容推送到屏幕顶部。
            Spacer()
        }
            /// 最外层VStack左右上下添加间距
//        .padding()
        
            .navigationBarTitle(Text(landmark.name), displayMode: .inline)
        
    }
}


/// 第一种结构符合View协议，并描述了视图的内容和布局。
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkDetail()
        LandmarkDetail(landmark: landmarkData[0])
    }
}
