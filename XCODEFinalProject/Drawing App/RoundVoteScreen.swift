//
//  RoundVoteScreen.swift
//  Drawing App
//
//  Created by Justin Lee on 5/2/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//

import UIKit

class RoundVoteScreen: UIViewController {
    var teamNames: [String] = []
    var turn = 69
    var scores = [0,0,0,0]
    var tempPromptText = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBOutlet weak var promptText: UILabel!
    @IBAction func PlusOne(_ sender: UIButton) {
        scores[turn] += 1
        performSegue(withIdentifier: "DoneVoting", sender: self)
    }
   
    @IBAction func MinusOne(_ sender: UIButton) {
        scores[turn] -= 1
        performSegue(withIdentifier: "DoneVoting", sender: self)
    }
    @IBAction func PlusZero(_ sender: UIButton) {
        performSegue(withIdentifier: "DoneVoting", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        promptText.text = tempPromptText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationVC = segue.destination as! GameStage
        destinationVC.teamNames = self.teamNames
        destinationVC.turn = self.turn
        destinationVC.scores = self.scores
    }

}
