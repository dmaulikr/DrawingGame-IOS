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
    var prompts:[String] = []
    
    @IBOutlet weak var turntNumber: UILabel!

    @IBOutlet weak var startDrawingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        turntNumber.text = String(turn)
        
        let appDelegate   = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        createPrompts(context: context)
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Prompts")
        
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    print(result)
                    if let words = result.value(forKey: "words") as? String{
                        prompts.append(words)
                        print (words)
                    }
                }
                PromptLabel.text = prompts[0]
            }
            else{
                print("error")
            }
        }
        catch{
            
        }
        
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
    
    //sets prompts variable of object
    func createPrompts(context: NSManagedObjectContext){
        let appDelegate   = UIApplication.shared.delegate as! AppDelegate
        
        
        let newPrompt = NSEntityDescription .insertNewObject(forEntityName: "Prompts", into: context)
        
        //check if we need to add in objects
        let testEmpty = NSFetchRequest<NSFetchRequestResult>(entityName: "Prompts")
        
        testEmpty.returnsObjectsAsFaults = false
        
        if(entityEmpty(contextUse: context, fetch: testEmpty)){
            
            newPrompt.setValue("Ram Ranch", forKey: "words")
            
            
            do {
                try context.save()
                print("Saved")
            } catch {
                //process error
            }
        }

    }
    
    //checks if entity set needs to have values added into it
    func entityEmpty(contextUse: NSManagedObjectContext, fetch: NSFetchRequest<NSFetchRequestResult>) -> Bool{
        do{
            let results = try contextUse.fetch(fetch)
            if(results.count <= 0){
                return true
            }
            else{
                for result in results as! [NSManagedObject]
                {
                    if result.value(forKey: "words") == nil{
                        return true
                    }
                }
                return false
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
