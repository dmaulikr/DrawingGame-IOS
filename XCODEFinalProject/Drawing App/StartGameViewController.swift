//
//  StartGameViewController.swift
//  Drawing App
//
//  Created by Justin Lee on 4/22/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {

    @IBOutlet weak var teamOneName: UITextField!
    
    @IBOutlet weak var teamTwoName: UITextField!
    
    @IBOutlet weak var teamThreeName: UITextField!
    
    @IBOutlet weak var teamFourName: UITextField!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var startGameButton: UIButton!
    
    @IBAction func makeNewPrompt(_ sender: UIButton) {
        performSegue(withIdentifier: "makePromptSegue", sender: self)
    }
    var teamNames : [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        teamOneName.resignFirstResponder()
        teamTwoName.resignFirstResponder()
        teamThreeName.resignFirstResponder()
        teamFourName.resignFirstResponder()
    }
    

    @IBAction func startNewGame(_ sender: UIButton) {
        teamNames = []
        if let team1 = teamOneName.text {teamNames.append(team1)}
        else {teamNames.append("")}
        if let team2 = teamTwoName.text {teamNames.append(team2)}
        else {teamNames.append("")}
        if let team3 = teamThreeName.text {teamNames.append(team3)}
        else {teamNames.append("")}
        if let team4 = teamFourName.text {teamNames.append(team4)}
        else {teamNames.append("")}
        if validTeamNames() {
            messageLabel.text = ""
            performSegue(withIdentifier: "newGameSegue", sender: self)
            /*
            let destinationVC = GameStage()
            destinationVC.teamNames = self.teamNames
            destinationVC.performSegue(withIdentifier: "newGameSegue", sender: self)
 */
        }
        else {messageLabel.text = "Please enter a team name for at least team 1 and team 2."}
        
    }
    
    func validTeamNames() -> Bool{
        return teamNames[0] != "" && teamNames[1] != ""
    }
    
    //creates segue setup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "makePromptSegue"{
            let destinationVC = segue.destination as! PromptMakerView
        }
        else{
        let destinationVC = segue.destination as! GameStage
        destinationVC.teamNames = self.teamNames
        }
    }
 

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
