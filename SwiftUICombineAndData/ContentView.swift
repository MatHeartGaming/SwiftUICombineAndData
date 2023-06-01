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
    @State private var showCertificates = false
    
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
            
            ProfileRow()
                .onTapGesture {
                    showCertificates.toggle()
                }
            
            VStack {
                NotificationRow()
                Divider()
                LiteModeRow()
            }
            .blurBackground()
            .padding(.top, 20)
            
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
            .blurBackground()
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
        .sheet(isPresented: $showCertificates) {
            CertificatesView()
        }
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
