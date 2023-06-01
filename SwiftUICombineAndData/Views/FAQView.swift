//
//  FAQView.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 31/05/23.
//

import SwiftUI

struct FAQView: View {
    
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
        .navigationTitle("FAQ")
        .background(Color("Background 2"))
        .edgesIgnoringSafeArea([.bottom, .horizontal])
    }
    
    var content : some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(faqData, id: \.id) {faq in
                FAQRow(faq: faq)
            }
            
            Text("Have any question?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .opacity(0.7)
        }
        .padding(.horizontal, 20)
    }
    
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
