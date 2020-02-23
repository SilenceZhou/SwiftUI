//
//  BadgeBackground.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
            GeometryReader{ geometry in
                Path { path in
    //                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                    // 使用 xScale 和 xOffset 调整变量将徽章置于其几何体中心
                     var width: CGFloat = min(geometry.size.width, geometry.size.height)
                    let height = width
                    path.move(
                        to: CGPoint(
                            x: width * 0.95,
                            y: height * (0.20 + HexagonParameters.adjustment)))
                    
                    /// 尾随闭包
                    HexagonParameters.points.forEach {
                        /// 只有这句代码 目前还不像开始的图像
                        path.addLine(
                            to: .init(
                                x: width * $0.useWidth.0 * $0.xFactors.0,
                                y: height * $0.useHeight.0 * $0.yFactors.0))
                        
                        /// 添加贝塞尔曲线
                        path.addQuadCurve(
                            to: .init(
                                x: width * $0.useWidth.1 * $0.xFactors.1,
                                y: height * $0.useHeight.1 * $0.yFactors.1),
                            control: .init(
                                x: width * $0.useWidth.2 * $0.xFactors.2,
                                y: height * $0.useHeight.2 * $0.yFactors.2
                            )
                        )
                    }
                }
                    
                .fill(
                    // 添加渐变色
                    LinearGradient(
                    gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                    startPoint: .init(x: 0.5, y: 0),
                    endPoint: .init(x: 0.5, y: 0.6)
                ))
                .aspectRatio(1, contentMode: .fit) // 调整至中间
                
                
            }
        }
        static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
        static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
