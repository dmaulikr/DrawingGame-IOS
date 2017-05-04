//
//  NewPromptScene.swift
//  Drawing App
//
//  Created by Justin Lee on 4/22/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//

import UIKit
import CoreData

class NewPromptScene: UIViewController {
    var teamNames: [String] = []
    var turn = 5
    var scores = [0,0,0,0]
    
    @IBOutlet weak var PromptLabel: UILabel!
    let appDelegate   = UIApplication.shared.delegate as! AppDelegate
    var people:[String] = []
    var places:[String] = []
    var movies:[String] = []
    var nature:[String] = []
    var sports:[String] = []
    var games:[String] = []
    
    //Buttons for Prompts
    @IBOutlet weak var peopleButton: UIButton!
    
    @IBOutlet weak var placesButton: UIButton!
    
    @IBOutlet weak var moviesButton: UIButton!
    
    @IBOutlet weak var natureButton: UIButton!
    
    @IBOutlet weak var sportsButton: UIButton!
    
    @IBOutlet weak var gamesButton: UIButton!
    
    
    
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
        destinationVC.promptText = self.PromptLabel.text!
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
    
    /**
     Prompt Buttons
     */
    
 
    @IBAction func peoplePress() {
        let appDelegate   = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if(people.count <= 0){
            DefaultPrompts.createPeoplePrompts(context: context)
            
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
            
            request.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(request)
                
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        print(result)
                        if let words = result.value(forKey: "prompt") as? String{
                            people.append(words)
                            print (words)
                        }
                    }
                    
                }
                else{
                    print("error")
                }
            }
            catch{
                
            }}
        let randomIndex = Int(arc4random_uniform(UInt32(people.count)))
        PromptLabel.text = people[randomIndex]
    }
    
    @IBAction func placesPress() {
        let appDelegate   = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if(places.count <= 0){
            DefaultPrompts.createPlacesPrompts(context: context)
            
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
            
            request.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(request)
                
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        print(result)
                        if let words = result.value(forKey: "prompt") as? String{
                            places.append(words)
                            print (words)
                        }
                    }
                    
                }
                else{
                    print("error")
                }
            }
            catch{
                
            }
        }
        let randomIndex = Int(arc4random_uniform(UInt32(places.count)))
        PromptLabel.text = places[randomIndex]
    }
    
    @IBAction func moviesPress() {
        let appDelegate   = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if(movies.count <= 0){
            DefaultPrompts.createMoviesPrompts(context: context)
        
        
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
            
            request.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(request)
                
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        print(result)
                        if let words = result.value(forKey: "prompt") as? String{
                            movies.append(words)
                            print (words)
                        }
                    }
                    
                }
                else{
                    print("error")
                }
            }
            catch{
                
            }
        }
        let randomIndex = Int(arc4random_uniform(UInt32(movies.count)))
        PromptLabel.text = movies[randomIndex]
    }
    
    @IBAction func naturePress() {
        let appDelegate   = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if(nature.count <= 0){
            DefaultPrompts.createNaturePrompts(context: context)
            
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Nature")
            
            request.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(request)
                
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        print(result)
                        if let words = result.value(forKey: "prompt") as? String{
                            nature.append(words)
                            print (words)
                        }
                    }
                    
                }
                else{
                    print("error")
                }
            }
            catch{
                
            }
        }
        let randomIndex = Int(arc4random_uniform(UInt32(nature.count)))
        PromptLabel.text = nature[randomIndex]
    }
    
    @IBAction func sportsPress() {
        let appDelegate   = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if(sports.count <= 0){
            DefaultPrompts.createSportsPrompts(context: context)
            
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Sports")
            
            request.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(request)
                
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        print(result)
                        if let words = result.value(forKey: "prompt") as? String{
                            sports.append(words)
                            print (words)
                        }
                    }
                    
                }
                else{
                    print("error")
                }
            }
            catch{
                
            }
        }
        let randomIndex = Int(arc4random_uniform(UInt32(sports.count)))
        PromptLabel.text = sports[randomIndex]
    }
    
    @IBAction func gamesPress() {
        let appDelegate   = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if(games.count <= 0){
            DefaultPrompts.createGamesPrompts(context: context)
            
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Games")
            
            request.returnsObjectsAsFaults = false
            
            do{
                let results = try context.fetch(request)
                
                if results.count > 0
                {
                    for result in results as! [NSManagedObject]
                    {
                        print(result)
                        if let words = result.value(forKey: "prompt") as? String{
                            games.append(words)
                            print (words)
                        }
                    }
                    
                }
                else{
                    print("error")
                }
            }
            catch{
                
            }
        }
        let randomIndex = Int(arc4random_uniform(UInt32(games.count)))
        PromptLabel.text = games[randomIndex]
        
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
