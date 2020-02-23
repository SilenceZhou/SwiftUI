//
//  CircleImage.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    // 添加存储属性
    var image: Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        /// 这个地方仅仅是添加一个预览视图
        CircleImage(image: Image("turtlerock"))
    }
}
