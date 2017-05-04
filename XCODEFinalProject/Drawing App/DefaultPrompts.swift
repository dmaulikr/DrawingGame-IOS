//
//  defaultPrompts.swift
//  Drawing App
//
//  Created by Justin Lee on 5/4/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//

import Foundation
import CoreData

class DefaultPrompts {
    
    
    //sets prompts variable of object
    static func createPeoplePrompts(context: NSManagedObjectContext, autoAdd:Bool = false){
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if autoAdd || entityEmpty(contextUse: context, fetch: testEmpty){
            
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
    static func createPlacesPrompts(context: NSManagedObjectContext, autoAdd:Bool = false){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Places", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Places")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(autoAdd || entityEmpty(contextUse: context, fetch: testEmpty)){
            
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
    static func createMoviesPrompts(context: NSManagedObjectContext, autoAdd:Bool = false){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Movies", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(autoAdd || entityEmpty(contextUse: context, fetch: testEmpty)){
            
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
    static func createNaturePrompts(context: NSManagedObjectContext, autoAdd:Bool = false){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Nature", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Nature")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(autoAdd || entityEmpty(contextUse: context, fetch: testEmpty)){
            
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
    static func createSportsPrompts(context: NSManagedObjectContext, autoAdd:Bool = false){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Sports", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Sports")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(autoAdd || entityEmpty(contextUse: context, fetch: testEmpty)){
            
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
    static func createGamesPrompts(context: NSManagedObjectContext, autoAdd:Bool = false){
        
        
        var newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Games", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Games")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(autoAdd || entityEmpty(contextUse: context, fetch: testEmpty)){
            
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
            newPrompt.setValue("Jump Rope", forKey: "prompt")
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
    static func entityEmpty(contextUse: NSManagedObjectContext, fetch: NSFetchRequest<NSFetchRequestResult>) -> Bool{
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
    
}
