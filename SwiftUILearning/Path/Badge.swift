//
//  Badge.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//  这一章节来学习绘制 路径 和 形状

import SwiftUI

struct Badge: View {
    
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount) { i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360
            )
            
        }
        .opacity(0.5)
        
//        RotatedBadgeSymbol(angle: .init(degrees: 0))
//            .opacity(0.5)
    }
    
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            /// GeometryReader一个容器视图，根据其自身大小和坐标空间定义其内容。
            /// GeometryReader动态报告有关父视图和设备的大小和位置信息，
            /// 并在大小更改时进行更新；例如，当用户旋转他们的iPhone时。
            GeometryReader { geometry in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0,
                              y:(3.0/4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
