//
//  SwiftUIView.swift
//  StoreHelper
//
//  Created by Russell Archer on 16/11/2022.
//

import SwiftUI

/// Displays links for terms of service and privacy policy
@available(iOS 15.0, macOS 12.0, *)
public struct TermsOfServiceAndPrivacyPolicyView: View {
    @EnvironmentObject var storeHelper: StoreHelper
    @State private var termsOfServiceUrl: URL?
    @State private var privacyPolicyUrl: URL?
    
    public init() {}
    
    public var body: some View {
        HStack {
            if let termsOfServiceUrl { Link("Terms of Service", destination: termsOfServiceUrl).font(.custom("WorkSans-Regular", size: 15)) }
            if termsOfServiceUrl != nil, privacyPolicyUrl != nil { Text("and").font(.custom("WorkSans-Regular", size: 15)) }
            if let privacyPolicyUrl { Link("Privacy Policy", destination: privacyPolicyUrl).font(.custom("WorkSans-Regular", size: 15)) }
        }
        .task {
            if  let termsOfService = Configuration.termsOfServiceUrl.stringValue(storeHelper: storeHelper),
                let tosUrl = URL(string: termsOfService) { termsOfServiceUrl = tosUrl }
            
            if  let privacyPolicy = Configuration.privacyPolicyUrl.stringValue(storeHelper: storeHelper),
                let ppUrl = URL(string: privacyPolicy) { privacyPolicyUrl =  ppUrl }
        }
    }
}
