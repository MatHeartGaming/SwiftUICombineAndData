//
//  LightModeRow.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 01/06/23.
//

import SwiftUI

struct LiteModeRow: View {
    
    @State private var isLiteMode : Bool = false
    
    var body: some View {
        Toggle(isOn: $isLiteMode) {
            HStack(spacing: 12) {
                GradientIcon(icon: "speedometer")
                VStack(alignment: .leading) {
                    Text("Lite Mode")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("Better performance. Recommended for iPhone X and older")
                        .font(.caption2)
                        .opacity(0.3)
                }
            }
        }
        .tint(Color(#colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)))
    }
}

struct LightModeRow_Previews: PreviewProvider {
    static var previews: some View {
        LiteModeRow()
    }
}
