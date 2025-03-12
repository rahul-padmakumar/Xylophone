//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onPressed(_ sender: UIButton) {
        playSound(title: sender.currentTitle ?? "")
        adjustAlpha(button: sender)
    }
    
    func playSound(title: String){
        print("Pressed \(title)")
        let url = Bundle.main.url(forResource: title, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
    func adjustAlpha(button: UIButton){
        animateAlpha {
            button.alpha = 0.5
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.animateAlpha {
                button.alpha = 1
            }
        }
    }
    
    func animateAlpha(f1:@escaping () -> Void){
        UIView.animate(withDuration: 0.3){
            f1()
        }
    }
    
}

