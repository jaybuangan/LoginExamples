//
//  BlurredViewController.swift
//  Login Examples
//
//  Created by Jay on 8/5/16.
//  Copyright © 2016 Jay Buangan. All rights reserved.
//

import UIKit

class BlurredViewController: UIViewController {

    @IBOutlet weak var loginButton: LoginButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginView: UIView!
    
    
    let effectView = UIVisualEffectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         setup()
    }

       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeLogin(sender: AnyObject) {
        UIView.animateWithDuration(0.4) {
            self.effectView.alpha = 0
            self.closeButton.alpha = 0
            self.loginView.alpha = 0
        }
    }
    
    @IBAction func showLogin(sender: AnyObject) {
        effectView.frame = backgroundImage.frame
        backgroundImage.addSubview(effectView)
        effectView.alpha = 0

        
        UIView.animateWithDuration(0.4) {
            self.effectView.effect = UIBlurEffect(style: .Dark)
            self.effectView.alpha = 0.9
            self.closeButton.alpha = 1.0
            self.loginView.alpha = 1.0
            
        }
    }
}

extension BlurredViewController {
    private func setup(){
        closeButton.alpha = 0
        loginView.alpha = 0
        
        textFieldSetup()
    }
    
    private func textFieldSetup(){
        let attributes = [NSForegroundColorAttributeName: UIColor.lightGrayColor()]
        username.attributedPlaceholder = NSAttributedString(string: "ENTER NAME", attributes: attributes)
        username.textColor = UIColor.whiteColor()
        
        password.attributedPlaceholder = NSAttributedString(string: "••••••••", attributes: attributes)
        password.textColor = UIColor.whiteColor()
        
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    



