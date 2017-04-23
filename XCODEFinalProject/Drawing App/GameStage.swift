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
    
    var turn = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
        destinationVC.turn = self.turn
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
