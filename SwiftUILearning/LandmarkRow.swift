//
//  LandmarkRow.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            /// 如果这图片资源没有也会报错
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        /// Group是用于将视图内容分组的容器。Xcode将组的子视图呈现为画布中的单独预览。
//        Group {
//            /// 用 previewLayout(_:) 修饰符设置行视图在列表中的预览大小。
//            LandmarkRow(landmark: landmarkData[0])
//                .previewLayout(.fixed(width: 300, height: 70))
//            LandmarkRow(landmark: landmarkData[1])
//                .previewLayout(.fixed(width: 300, height: 70))
//        }
        
        /// 改进-简化代码
        
        Group {
            /// 用 previewLayout(_:) 修饰符设置行视图在列表中的预览大小。
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
