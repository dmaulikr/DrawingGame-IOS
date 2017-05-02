//
//  GameStage.swift
//  Drawing App
//
//  Created by Justin Lee on 4/22/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//

import UIKit

class GameStage: UIViewController {

    var teamNames: [String] = []
    
    @IBOutlet weak var continueGame: UIButton!
    
    @IBOutlet var teamNumberLabels: [UILabel]!
    
    @IBOutlet var teamNameLabels: [UILabel]!

    @IBOutlet var scoreTitleLabel: [UILabel]!
    
    @IBOutlet var scoreValueLabel: [UILabel]!
    
    var turn = -1
    
    var numTeams = 0
    
    var scores = [0,0,0,0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(teamNames)
        for i in 0...teamNames.count-1{
            teamNameLabels[i].text! = teamNames[i]
        }
        print(scores)
        findNumTeams()
        // Do any additional setup after loading the view.
        for i in 0...teamNames.count-1{
            if teamNames[i] != ""{
                teamNameLabels[i].text = teamNames[i]
            }
            else{
                teamNameLabels[i].isHidden = true
                teamNumberLabels[i].isHidden = true
                scoreTitleLabel[i].isHidden = true
                scoreValueLabel[i].isHidden = true
            }
            
        }
        for i in 0...teamNames.count-1{
            scoreValueLabel[i].text = String(scores[i])
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextRound(_ sender: UIButton) {
        performSegue(withIdentifier: "startRoundSegue", sender: self)
        
    }
    
    //creates segue setup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! NewPromptScene
        
        if turn != numTeams-1{
            turn += 1
        }
        else{
            turn = 0
        }
        print(turn)
        destinationVC.teamNames = self.teamNames
        destinationVC.turn = self.turn
        destinationVC.scores = self.scores
    }
    
    func findNumTeams() {
        var counter = 0
        for i in 0...teamNames.count-1{
            if teamNames[i] != ""{
                counter += 1
            }
        }
        numTeams = counter
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
