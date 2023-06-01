//
//  CertificatesView.swift
//  SwiftUICombineAndData
//
//  Created by Matteo Buompastore on 01/06/23.
//

import SwiftUI

struct CertificatesView: View {
    
    @StateObject var certificateVM = CertificateViewModel()
    @StateObject var networkReachability = NetworkReachability()
    @State private var selection : Int = 0
    
    var body: some View {
        VStack {
            if networkReachability.reachable {
                if certificateVM.certificates.isEmpty {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .tint(.primary)
                } else {
                    TabView(selection: $selection) {
                        ForEach(certificateVM.certificates.indices, id: \.self) {index in
                            CertificateCard(selection: $selection)
                                .environmentObject(certificateVM)
                                .padding(.horizontal)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                }
            } else {
                Text("Please connecto to the internet to see your certificates")
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .background(AccountBackground())
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView()
    }
}
