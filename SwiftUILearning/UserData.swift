//
//  UserData.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//

import SwiftUI

// ObservableObject 需要发布对其数据的任何更改，以便其订阅者可以获取其更改。
final class UserData:ObservableObject {
    
   @Published var showFavoritesOnly = false
   @Published var landmarks = landmarkData
    
}
