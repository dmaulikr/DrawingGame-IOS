//
//  ViewController.swift
//  Drawing App
//
//  Created by Justin Lee on 4/22/17.
//  Copyright © 2017 examplecompany. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var toolIcon: UIButton!
    @IBOutlet weak var timeRemaining: UILabel!
    var teamNames: [String] = []
    var seconds = 60
    var timer = Timer()
    var isTimeRunning = false
    
    var promptText = ""
    var lastPoint = CGPoint.zero
    var swiped = false
    
    var red:CGFloat = 0.0
    var green:CGFloat = 0.0
    var blue:CGFloat = 0.0
    
    var tool:UIImageView!
    var isDrawing = true
    var selectedImage:UIImage!
    
    var turn = 69
    var scores = [0,0,0,0]
    
    @IBAction func finishedDrawing(_ sender: UIButton) {
        performSegue(withIdentifier: "DrawingDone", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tool = UIImageView()
        tool.frame = CGRect(x: self.view.bounds.size.width, y: self.view.bounds.size.height, width: 38, height: 38)
        tool.image = #imageLiteral(resourceName: "paintBrush")
        self.view.addSubview(tool)
        runTimer()
        
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        seconds -= 1
        timeRemaining.text = String(seconds)
        if seconds == 0{
            performSegue(withIdentifier: "DrawingDone", sender: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    func drawLines(fromPoint:CGPoint,toPoint:CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        tool.center = toPoint
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor)
        
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
    @IBAction func reset(_ sender: AnyObject) {
        self.imageView.image = nil
    }
    @IBAction func save(_ sender: AnyObject) {
        
        let actionSheet = UIAlertController(title: "Pick your option", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Pick an image", style: .default, handler: { (_) in
            
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Save your drawing", style: .default, handler: { (_) in
            if let image = self.imageView.image{
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        present(actionSheet, animated: true, completion: nil)
        
    }
    @IBAction func erase(_ sender: AnyObject) {
        
        if (isDrawing) {
            (red,green,blue) = (1,1,1)
            tool.image = #imageLiteral(resourceName: "EraserIcon")
            toolIcon.setImage(#imageLiteral(resourceName: "paintBrush"), for: .normal)
            
        } else {
            (red,green,blue) = (0,0,0)
            tool.image = #imageLiteral(resourceName: "paintBrush")
            toolIcon.setImage(#imageLiteral(resourceName: "EraserIcon"), for: .normal)
        }
        
        isDrawing = !isDrawing
        
    }
    @IBAction func settings(_ sender: AnyObject) {
    }
    
    @IBAction func colorsPicked(_ sender: AnyObject) {
        if sender.tag == 0 {
            (red,green,blue) = (1,0,0)
        } else if sender.tag == 1 {
            (red,green,blue) = (0,1,0)
        } else if sender.tag == 2 {
            (red,green,blue) = (0,0,1)
        } else if sender.tag == 3 {
            (red,green,blue) = (1,0,1)
        } else if sender.tag == 4 {
            (red,green,blue) = (1,1,0)
        } else if sender.tag == 5 {
            (red,green,blue) = (0,1,1)
        } else if sender.tag == 6 {
            (red,green,blue) = (1,1,1)
        } else if sender.tag == 7 {
            (red,green,blue) = (0,0,0)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DrawingDone"{
            let destinationVC = segue.destination as! VoteScreen
            print(turn)
            destinationVC.teamNames = self.teamNames
            destinationVC.turn = self.turn
            destinationVC.scores = self.scores
            destinationVC.promptText = self.promptText
            if let image = self.imageView.image {

                destinationVC.image = image
                
            }
        }
        else{
            super.prepare(for: segue, sender: sender)
            let settingsVC = segue.destination as! SettingsVC
            settingsVC.delegate = self
            settingsVC.red = red
            settingsVC.green = green
            settingsVC.blue = blue
        }
        timer.invalidate()
    }
    
    
}

extension ViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate,SettingsVCDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imagePicked = info[UIImagePickerControllerOriginalImage] as? UIImage {
            // We got the user's image
            self.selectedImage = imagePicked
            self.imageView.image = selectedImage
            
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func settingsViewControllerDidFinish(_ settingsVC: SettingsVC) {
        self.red = settingsVC.red
        self.green = settingsVC.green
        self.blue = settingsVC.blue
    }
}


















