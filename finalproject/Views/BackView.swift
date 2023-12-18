//
//  CustomBackView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/10/23.
//
import SwiftUI

struct BackView: View {
    // Action to be performed when the button is tapped
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "arrow.left") // Using a system image for the back icon
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue) // You can customize the color

                Text("Back")
                    .fontWeight(.semibold)
                    .foregroundColor(.blue) // Customize the text color
            }
            .padding() // Add padding for a better touch area
        }
    }
}

struct ContentView: View {
    var body: some View {
        BackView {
            // Define what should happen when the back button is tapped
            // For example, pop the current view
            print("Back button tapped")
        }
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
