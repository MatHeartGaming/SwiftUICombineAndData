//
//  PackagesView.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 31/05/23.
//

import SwiftUI

struct PackagesView: View {
    
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        ZStack(alignment: .top) {
            TrackableScrollView { offsetPoint in
                contentOffset = offsetPoint.y
            } content: {
                content
            }
            
            VisualEffectBlur(blurStyle: .systemMaterial)
                .opacity(contentOffset < -16 ? 1 : 0)
                .ignoresSafeArea()
                .frame(height: 0)

            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("SwiftUI Packages")
        .background(Color("Background 2"))
        .edgesIgnoringSafeArea([.bottom, .horizontal])
    }
    
    var content : some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("This app was 100% made using SwiftUI. We’d like to thank these amazing Swift Packages for making our lives as creators easier.")
                .font(.subheadline)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fixedSize(horizontal: false, vertical: true)
            
            ForEach(packagesData, id: \.id) { package in
                PackageRow(package: package)
            }
        }
        .padding(.horizontal, 20)
    }
    
    
}

struct PackagesView_Previews: PreviewProvider {
    static var previews: some View {
        PackagesView()
            .preferredColorScheme(.dark)
    }
}
