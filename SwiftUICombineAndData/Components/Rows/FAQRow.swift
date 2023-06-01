//
//  FAQRow.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 01/06/23.
//

import SwiftUI

struct FAQRow: View {
    
    var faq : FAQ
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(faq.question)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(faq.answer)
                .font(.subheadline)
                .opacity(0.7)
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FAQRow_Previews: PreviewProvider {
    static var previews: some View {
        FAQRow(faq: faqData[0])
    }
}
