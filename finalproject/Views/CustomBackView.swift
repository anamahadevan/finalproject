//
//  CustomBackView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/10/23.
//

import SwiftUI

struct Navigation_CustomBackButton: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go To Detail",
                           destination: Navigation_CustomBackButton_Detail())
        }
    }
}
// Second Screen
struct Navigation_CustomBackButton_Detail: View {
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
    Navigation_CustomBackButton()
}
