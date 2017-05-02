//
//  NewPromptScene.swift
//  Drawing App
//
//  Created by Justin Lee on 4/22/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//

import UIKit

class NewPromptScene: UIViewController {
    var teamNames: [String] = []
    var turn = 5
    var scores = [0,0,0,0]
    
    @IBOutlet weak var turntNumber: UILabel!

    @IBOutlet weak var startDrawingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        turntNumber.text = String(turn)
        
    }
    
    //creates segue setup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        print(turn)
        destinationVC.teamNames = self.teamNames
        destinationVC.turn = self.turn
        destinationVC.scores = self.scores
    }

    //negates navigation bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startDrawing(_ sender: UIButton) {
        performSegue(withIdentifier: "startDrawingSegue", sender: self)
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
