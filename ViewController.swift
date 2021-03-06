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
        startButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 50/255, alpha: 1)
        startButton.layer.cornerRadius = startButton.frame.height * 0.50
        pauseButton.backgroundColor = UIColor.init(red: 244/255, green: 232/255, blue: 0/255, alpha: 1)
        pauseButton.layer.cornerRadius = pauseButton.frame.height * 0.50
    }

    //UI buttons / labels
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!

    
    
    //timer stuff
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
    //display time left
    @IBOutlet weak var countdownTimerLabel: UILabel!
//    func pauseTimer (totalTime: Int) -> Int {
//        print (totalTime)
//        return totalTime
//    }
    
//    //actions on button clicks
//    @IBAction func countdownPause(_ sender: UIButton) {
//
//    }

    @IBAction func startCountdownTimer(_ sender: UIButton) {
        startTimer (minutes: 1)
    }

    
       // weak var startButton: UIButton!
    
    //format seconds into minutes and seconds
    func timeFormatted (_ totalSeconds: Int) -> String {
        let seconds: Int = totalTime % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

