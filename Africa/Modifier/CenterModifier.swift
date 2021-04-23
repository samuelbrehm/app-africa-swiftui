//
//  CenterModifier.swift
//  Africa
//
//  Created by Samuel Brehm on 23/04/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
