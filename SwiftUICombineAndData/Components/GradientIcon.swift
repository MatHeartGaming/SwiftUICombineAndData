//
//  GradientIcon.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 31/05/23.
//

import SwiftUI

struct GradientIcon: View {
    
    var icon = "questionmark"
    
    var body: some View {
        LinearGradient(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
            .mask(
                Image(systemName: icon)
                    .font(.system(size:17)))
            .background(Color(#colorLiteral(red: 0.26, green: 0.18, blue: 0.62, alpha: 0.8)))
            .frame(width: 36, height: 36)
            .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(lineWidth: 1)
                .foregroundColor(.white)
                .blendMode(.overlay)
            )
        
        //MARK: This would create a square around the question mark image
        /*Image(systemName: icon)
            .font(.system(size:17))
            .background(
                LinearGradient(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5607843137, blue: 0.9803921569, alpha: 1))], startPoint: .topLeading, endPoint: .bottomTrailing)
            )*/
    }
}

struct GradientIcon_Previews: PreviewProvider {
    static var previews: some View {
        GradientIcon()
    }
}
