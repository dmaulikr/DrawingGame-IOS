//
//  PromptMakerView.swift
//  Drawing App
//
//  Created by Justin Lee on 5/4/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//

import UIKit
import CoreData

class PromptMakerView: UIViewController {
    
    @IBOutlet weak var promptTextField: UITextField!
    
    @IBOutlet weak var peopleButton: UIButton!
    @IBOutlet weak var placesButton: UIButton!
    @IBOutlet weak var moviesButton: UIButton!
    @IBOutlet weak var natureButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var gamesButton: UIButton!
    

    let defaultDifficulty = 2
    
    let appDelegate   = UIApplication.shared.delegate as! AppDelegate
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        promptTextField.resignFirstResponder()
           }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addToPeople(_ sender: UIButton) {
        let context = appDelegate.persistentContainer.viewContext
        if let prompt = promptTextField.text{
            if(prompt.characters.count >= 3){
                if(prompt == "default"){
                    DefaultPrompts.createPeoplePrompts(context: context)
                }
                else{
                    addToEntity(context: context, entity: "People", prompt: prompt)
                }
                promptTextField.text = ""
            }
        }
    }
    
    @IBAction func addToPlaces(_ sender: UIButton) {
        let context = appDelegate.persistentContainer.viewContext
        if let prompt = promptTextField.text{
            if(prompt.characters.count >= 3){
                if(prompt == "default"){
                    DefaultPrompts.createPlacesPrompts(context: context)
                }
                else{
                    addToEntity(context: context, entity: "Places", prompt: prompt)
                }
                promptTextField.text = ""
            }
        }
    }
    
    @IBAction func addToMovies(_ sender: UIButton) {
        let context = appDelegate.persistentContainer.viewContext
        if let prompt = promptTextField.text{
            if(prompt.characters.count >= 3){
                if(prompt == "default"){
                    DefaultPrompts.createMoviesPrompts(context: context)
                }
                else{
                    addToEntity(context: context, entity: "Movies", prompt: prompt)
                }
                promptTextField.text = ""
            }
        }
    }
    
    @IBAction func addToNature(_ sender: UIButton) {
        let context = appDelegate.persistentContainer.viewContext
        if let prompt = promptTextField.text{
            if(prompt.characters.count >= 3){
                if(prompt == "default"){
                    DefaultPrompts.createNaturePrompts(context: context)
                }
                else{
                    addToEntity(context: context, entity: "Nature", prompt: prompt)
                }
                promptTextField.text = ""
            }
        }
    }
    
    @IBAction func addToSports(_ sender: UIButton) {
        let context = appDelegate.persistentContainer.viewContext
        if let prompt = promptTextField.text{
            if(prompt.characters.count >= 3){
                if(prompt == "default"){
                    DefaultPrompts.createSportsPrompts(context: context)
                }
                else{
                    addToEntity(context: context, entity: "Sports", prompt: prompt)
                }
                promptTextField.text = ""
            }
        }
    }
    
    @IBAction func addToGames(_ sender: UIButton) {
        let context = appDelegate.persistentContainer.viewContext
        if let prompt = promptTextField.text{
            if(prompt.characters.count >= 3){
                if(prompt == "default"){
                    DefaultPrompts.createGamesPrompts(context: context)
                }
                else{
                    addToEntity(context: context, entity: "Games", prompt: prompt)
                }
                promptTextField.text = ""
            }
        }
    }
    
    //adds a prompt to specified entity
    func addToEntity(context:NSManagedObjectContext, entity:String, prompt:String){
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: entity, into: context)
        newPrompt.setValue(prompt, forKey: "prompt")
        newPrompt.setValue(defaultDifficulty, forKey: "difficulty")
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
