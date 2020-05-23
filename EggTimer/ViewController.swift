//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":300, "Medium":420, "Hard":720]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
    }

    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            let percentageProgress = (Double(secondsPassed) / Double(totalTime))
            
            progressBar.progress = Float(percentageProgress)
            secondsPassed += 1
            

        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
    
    
}
