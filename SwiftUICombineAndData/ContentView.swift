//
//  ContentView.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme : ColorScheme
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                TrackableScrollView { offset in
                    withAnimation(.easeIn) {
                        contentOffset = offset.y
                    }
                    print("Content offset \(contentOffset)")
                } content: {
                    content
                }
                
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .ignoresSafeArea()
                    .frame(height: 0)
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .toolbar(.hidden)
        }
        .ignoresSafeArea()
        .tint(colorScheme == .dark ? .white : .blue)
    }
    
    var content : some View {
        
        VStack {
            VStack {
                NavigationLink {
                    FAQView()
                } label: {
                    MenuRow()
                }
                
                divider
                
                NavigationLink {
                    PackagesView()
                } label: {
                    MenuRow(title: "SwiftUI Packages", leftIcon: "square.stack.3d.up.fill")
                }
                
                divider
                
                Link(destination: URL(string: "https://www.youtube.com/channel/UCTIhfOopxukTIRkbXJ3kN-g")!,
                     label: {
                    MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
                })
            }
            .padding()
            .background(Color("Background 1"))
            .background(VisualEffectBlur(blurStyle: .systemThinMaterialDark))
            .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(.white, lineWidth: 1).blendMode(.overlay))
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .padding(.top, 20)
            
            Text("Version 1.0")
                .foregroundColor(.white.opacity(0.7))
                .padding(.top, 20)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .font(.footnote)
            
        }
        .foregroundColor(.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
    
    var divider : some View {
        Divider()
            .background(.white.blendMode(.overlay))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
