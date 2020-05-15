//
//  ViewController.swift
//  circuit_training_timer
//
//  Created by thomas mcnutt on 5/14/20.
//  Copyright © 2020 thomas mcnutt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    let minutes = 25
    var timer: Timer?
    var totalTime = 0 //initialize the number of seconds
    
    private func startTimer (minutes: Int) {
        self.totalTime = self.minutes * 60 //switches minutes to seconds
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector (updateTimer), userInfo: nil, repeats: true)
    }
    
    //function to decrement the time if > 0
    @objc func updateTimer () {
        self.countdownTimerLabel.text = self.timeFormatted(self.totalTime) //Show timer
        if totalTime != 0 {
            totalTime -= 1
        } else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    @IBOutlet weak var countdownTimerLabel: UILabel!
    @IBAction func startCountdownTimer(_ sender: UIButton) {
        startTimer (minutes: 1)
    }
    
    
    //format seconds into minutes and seconds
    func timeFormatted (_ totalSeconds: Int) -> String {
        let seconds: Int = totalTime % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

