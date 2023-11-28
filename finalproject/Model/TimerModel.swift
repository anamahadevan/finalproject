//
//  TimerModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/10/23.
//


import Foundation

extension TimerView {
    final class TimerClass: ObservableObject {
        @Published var isActive = false
        @Published var showingAlert = false
        @Published var time: String = "25:00" // computed variable mb
        @Published var startTimeSeconds: Float = 25*60
        // updating seconds with didSet
        @Published var secondsLeft = 0 {
            didSet {
                self.time = "\(Int(startTimeSeconds)):00"
            }
        }
        
        
        // start the timer with the given amount of minutes
        func start(startTimeSeconds: Float) {
            self.secondsLeft = Int(startTimeSeconds)
            self.isActive = true
        }
        
        // pause the timer , stops decrementing
        func pause(startTimeSeconds: Float) {
            self.isActive = !isActive
        }
        
        // Reset the timer
        func reset() {
            self.startTimeSeconds = Float(secondsLeft)
            self.isActive = false
        }
        
        // Show updates of the timer
        func currTime(){
            guard isActive else { return }
            
            //decrements the amounts of seconds left on the clock
            secondsLeft -= 1
            
            // Checks that the countdown is not <= 0
            if secondsLeft <= 0 {
                self.isActive = false
                self.showingAlert = true
                return
            }
            
        }
    }
}
