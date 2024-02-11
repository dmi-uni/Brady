//
//  StopwatchManager.swift
//  Brady WatchKit Extension
//
//  Created by Aldo Di Giovanni on 07/06/22.
//

import Foundation
import SwiftUI

//maybe we need start(at: ) for smart alarm

class StopwatchManager: NSObject, ObservableObject {
    private var runtimeSession: WKExtendedRuntimeSession?
    
    func startRuntimeSession(after sessionInterval: Double) {
        guard runtimeSession?.state != .running else { return }
        
        runtimeSession = WKExtendedRuntimeSession()
        runtimeSession?.delegate = self
        runtimeSession?.start(at: Date(timeIntervalSinceNow: sessionInterval))
    }
    
    func invalidateRuntimeSession() {
        runtimeSession?.invalidate()
        runtimeSession = nil
    }
    
    var selectedSession: SessionActivityType? {
        didSet {
            guard let selectedSession = selectedSession else { return }
            mealViewModel.sessionActivityType = selectedSession
            
            startSession(sessionType: selectedSession)
        }
    }
    
    @Published var showingSummaryView = false
    @Published var mealViewModel: MealViewModel
    
    init(sessionActivityType: SessionActivityType) {
        self._mealViewModel = .init(wrappedValue: MealViewModel(sessionActivityType))
        print("SESSION: ", sessionActivityType.interval)
    }
    
    
    @Published var running = false
    @Published var elapsedTime: TimeInterval = 0.0
    @Published var elapsedTimeOnBoarding3: TimeInterval = 0.0
    @Published var elapsedTimeOnBoarding6: TimeInterval = 0.0
    
    @Published var animationProgress: Int = 0
    @Published var open = false
    @Published var newLevel = false
    
    var timer = Timer()
    
    func startSession(sessionType: SessionActivityType) {
        
        startRuntimeSession(after: Double(sessionType.interval + 1))
        
        elapsedTime = 0.0
        animationProgress = 0
        open = false
        
        mealViewModel.dotsPosition = Constants.getDotPositionByLevel(name: sessionType)
        
        running = true
        //        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            
            self.elapsedTime = self.elapsedTime + 0.5
            
            if self.elapsedTime == 0.5 {
                Vibration.call()
            }
            
            let reminder = Double(Int(self.elapsedTime) % sessionType.interval) + self.elapsedTime.truncatingRemainder(dividingBy: 1)
            guard reminder > 2 || reminder < 1 else { return }
            
            if reminder == 2.5 {
                for i in 0 ... self.mealViewModel.dotsPosition.count - 1 {
                    self.mealViewModel.dotsPosition[i].3 = 1
                }
                self.animationProgress = 0
            } else if self.elapsedTime > 2 {
                self.open.toggle()
                if self.open {
                    for i in (0 ... self.mealViewModel.dotsPosition.count - 1).shuffled() {
                        if self.mealViewModel.dotsPosition[i].3 == 1 {
                            self.mealViewModel.dotsPosition[i].3 = 0
                            break
                        }
                    }
                    self.animationProgress += 1
                }
            }
        }
    }
    
    func togglePause() {
        if running == true {
            self.pause()
        } else {
            resume()
        }
    }
    
    func pause() {
        running = false
        timer.invalidate()
        runtimeSession?.invalidate()
        runtimeSession = nil
    }
    
    func resume() {
        
        running = true
        
        guard let interval = selectedSession?.interval else { return }
        let timeBeforeIntervalEnd = Double(interval - Int(self.elapsedTime) % interval) + self.elapsedTime.truncatingRemainder(dividingBy: 1)
        startRuntimeSession(after: timeBeforeIntervalEnd + 1)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [self] timer in
            
            self.elapsedTime += 0.5
            
            let reminder = Double(Int(self.elapsedTime) % selectedSession!.interval) + self.elapsedTime.truncatingRemainder(dividingBy: 1)
            guard reminder > 2 || reminder < 1 else { return }
            
            if reminder == 2.5 {
                for i in 0 ... self.mealViewModel.dotsPosition.count - 1 {
                    self.mealViewModel.dotsPosition[i].3 = 1
                }
                self.animationProgress = 0
            } else if self.elapsedTime > 2 {
                self.open.toggle()
                if self.open {
                    for i in (0 ... self.mealViewModel.dotsPosition.count - 1).shuffled() {
                        if self.mealViewModel.dotsPosition[i].3 == 1 {
                            self.mealViewModel.dotsPosition[i].3 = 0
                            break
                        }
                    }
                    self.animationProgress += 1
                }
            }
        }
    }
    
    func endSession(showSummary: Bool) {
        invalidateRuntimeSession()
        running = false
        timer.invalidate()
        selectedSession = nil
        if showSummary {
            showingSummaryView = true
        }
    }
    
    func resetSession() {
        elapsedTime = 0.0
        animationProgress = 0
        open = false
        mealViewModel.dotsPosition = Constants.getDotPositionByLevel(name: mealViewModel.sessionActivityType)
    }
    
    func startOnBoarding3() {
        running = true
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ timer in
            self.elapsedTimeOnBoarding3 += 0.01
        }
    }
    
    func startOnBoarding6() {
        running = true
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ timer in
            self.elapsedTimeOnBoarding6 += 0.01
        }
    }
    
    func resetOnBoarding3(){
        elapsedTimeOnBoarding3 = 0.0
    }
    
    func resetOnBoarding6(){
        elapsedTimeOnBoarding6 = 0.0
    }
}

extension StopwatchManager: WKExtendedRuntimeSessionDelegate {
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
        print("WKExtendedRuntimeSessiondidInvalidateWith")
        runtimeSession = nil
        guard let interval = selectedSession?.interval, running else { return }
        let timeBeforeIntervalEnd = Double(interval - Int(self.elapsedTime) % interval) + self.elapsedTime.truncatingRemainder(dividingBy: 1)
        startRuntimeSession(after: timeBeforeIntervalEnd + 1)
    }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        print("extendedRuntimeSessionDidStart")
        extendedRuntimeSession.notifyUser(hapticType: .success, repeatHandler: {arg in
            return Double(self.selectedSession?.interval ?? 10000000)
        })
    }
    
    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        print("extendedRuntimeSessionWillExpire")
        print(Date.now)
    }
}
