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
            createPeoplePrompts(context: context)
            
            
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
            createPlacesPrompts(context: context)
            
            
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
            createMoviesPrompts(context: context)
        
        
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
            createNaturePrompts(context: context)
            
            
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
            createSportsPrompts(context: context)
            
            
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
            createGamesPrompts(context: context)
            
            
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

    
    
    //sets prompts variable of object
    func createPeoplePrompts(context: NSManagedObjectContext){
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(entityEmpty(contextUse: context, fetch: testEmpty)){
            
            var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "People", into: context)
            newPrompt.setValue("Leonardo Divinci", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "People", into: context)
            newPrompt.setValue("Iron Man", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "People", into: context)
            newPrompt.setValue("Super Man", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "People", into: context)
            newPrompt.setValue("Hulk", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
        
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "People", into: context)
            newPrompt.setValue("Kim Kardashian", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "People", into: context)
            newPrompt.setValue("Kanye West", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "People", into: context)
            newPrompt.setValue("North West", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            
            do {
                try context.save()
                print("Saved")
            } catch {
                //process error
            }
        }
    }
    
    //sets prompts variable of object
    func createPlacesPrompts(context: NSManagedObjectContext){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Places", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(entityEmpty(contextUse: context, fetch: testEmpty)){
            
            newPrompt.setValue("Paris", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Places", into: context)
            newPrompt.setValue("Sydney", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Places", into: context)
            newPrompt.setValue("London", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Places", into: context)
            newPrompt.setValue("New York", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Places", into: context)
            newPrompt.setValue("USA", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Places", into: context)
            newPrompt.setValue("Bangledash", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            
            do {
                try context.save()
                print("Saved")
            } catch {
                //process error
            }
        }
    }
    
    //sets prompts variable of object
    func createMoviesPrompts(context: NSManagedObjectContext){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Movies", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(entityEmpty(contextUse: context, fetch: testEmpty)){
            
            newPrompt.setValue("Tokyo Drift", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Movies", into: context)
            newPrompt.setValue("50 First Dates", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Movies", into: context)
            newPrompt.setValue("Bourne Ultimatum", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Movies", into: context)
            newPrompt.setValue("Saving Private Ryan", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Movies", into: context)
            newPrompt.setValue("Snow White", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Movies", into: context)
            newPrompt.setValue("Bambi", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            
            do {
                try context.save()
                print("Saved")
            } catch {
                //process error
            }
        }
    }
    
    //sets prompts variable of object
    func createNaturePrompts(context: NSManagedObjectContext){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Nature", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Nature")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(entityEmpty(contextUse: context, fetch: testEmpty)){
            
            newPrompt.setValue("Panda", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Nature", into: context)
            newPrompt.setValue("Poison Oak", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Nature", into: context)
            newPrompt.setValue("Lion", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Nature", into: context)
            newPrompt.setValue("Rafflesia", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Nature", into: context)
            newPrompt.setValue("Venus Fly Trap", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Nature", into: context)
            newPrompt.setValue("Antelope", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            
            do {
                try context.save()
                print("Saved")
            } catch {
                //process error
            }
        }
    }
    
    //sets prompts variable of object
    func createSportsPrompts(context: NSManagedObjectContext){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Sports", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Sports")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(entityEmpty(contextUse: context, fetch: testEmpty)){
            
            newPrompt.setValue("Cricket", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Sports", into: context)
            newPrompt.setValue("Rugby", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Sports", into: context)
            newPrompt.setValue("Synchronized Swimming", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Sports", into: context)
            newPrompt.setValue("Football", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Sports", into: context)
            newPrompt.setValue("Michal Phelps", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Sports", into: context)
            newPrompt.setValue("Basketball", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            
            do {
                try context.save()
                print("Saved")
            } catch {
                //process error
            }
        }
    }
    
    //sets prompts variable of object
    func createGamesPrompts(context: NSManagedObjectContext){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Games", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Games")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(entityEmpty(contextUse: context, fetch: testEmpty)){
            
            newPrompt.setValue("Red Dead Redemption", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Games", into: context)
            newPrompt.setValue("Megadimension Neptunia", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Games", into: context)
            newPrompt.setValue("Persona", forKey: "prompt")
            newPrompt.setValue(3, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Games", into: context)
            newPrompt.setValue("Super Mario", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Games", into: context)
            newPrompt.setValue("Monopoly", forKey: "prompt")
            newPrompt.setValue(2, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Games", into: context)
            newPrompt.setValue("Sucking Cock", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Games", into: context)
            newPrompt.setValue("Tic Tac Toe", forKey: "prompt")
            newPrompt.setValue(1, forKey: "difficulty")
            
            
            do {
                try context.save()
                print("Saved")
            } catch {
                //process error
            }
        }
    }
    
    //helper method to check if entity set needs to have values added into it
    func entityEmpty(contextUse: NSManagedObjectContext, fetch: NSFetchRequest<NSFetchRequestResult>) -> Bool{
        do{
            let results = try contextUse.fetch(fetch)
            if(results.count <= 0){
                return true
            }
            else{
                for result in results as! [NSManagedObject]
                {
                    if result.value(forKey: "prompt") != nil{
                        return false
                    }
                }
                return true
            }
            
        }
        catch{
            return true;
        }
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
