//
//  VoteScreen.swift
//  Drawing App
//
//  Created by Justin Lee on 5/2/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//

import UIKit

class VoteScreen: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var teamNames: [String] = []
    var image : UIImage?
    var seconds = 60
    var timer = Timer()
    var isTimeRunning = false
    var turn = 5
    var scores = [0,0,0,0]
    
    @IBOutlet weak var TimeRemaining: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let temp = image{
            imageView.image = temp
        }
        runTimer()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        seconds -= 1
        TimeRemaining.text = String(seconds)
        if seconds == 0{
            performSegue(withIdentifier: "FinishedGuessing", sender: self)
        }
    }
    
    @IBAction func finishedGuessing(_ sender: UIButton) {
        performSegue(withIdentifier: "FinishedGuessing", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        print(turn)
        let destinationVC = segue.destination as! RoundVoteScreen
        destinationVC.teamNames = self.teamNames
        destinationVC.turn = self.turn
        destinationVC.scores = self.scores
    }
}
