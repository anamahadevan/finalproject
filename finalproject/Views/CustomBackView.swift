//
//  CustomBackView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/10/23.
//

import SwiftUI


// Second Screen
struct CustomBackView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Label("Back", systemImage: "arrow.left.circle")
                }
            }
        }
    }
}

#Preview {
    CustomBackView()
}
