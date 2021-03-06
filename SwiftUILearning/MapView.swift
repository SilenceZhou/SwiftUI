//
//  MapView.swift
//  SwiftUILearning
//
//  Created by SilenceZhou on 2020/2/23.
//  Copyright © 2020 SilenceZhou. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    // 需要传递的参数
    var coordinate: CLLocationCoordinate2D
    
    
    // UIViewRepresentable 需要实现两个必要方法
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
//        let coordinate = CLLocationCoordinate2D(latitude: 34.01111, longitude: -116.166777)
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
//        MapView()
        
        MapView(coordinate: landmarkData[0].locationCoordinate)
    }
}
