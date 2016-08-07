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
    @IBOutlet weak var loginConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var socialLoginStack: UIStackView!
   
    
    @IBOutlet weak var slTopConstraint: NSLayoutConstraint!
    let effectView = UIVisualEffectView()
    var loginConstraintConstant:CGFloat = 0.0
    var slTopConstraintConstant: CGFloat = 0.0
    
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
        
        UIView.animateWithDuration(0.7, delay: 0.0,
                                   usingSpringWithDamping: 0.33, initialSpringVelocity: 0,
                                   options: [], animations: {
                                    
                                
                                    
                                    self.loginConstraint.constant = self.loginConstraintConstant

                                    self.view.layoutIfNeeded()
                                    
            }, completion: nil)
        
        
        self.slHide()
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
        
        UIView.animateWithDuration(0.7, delay: 0.0,
                                   usingSpringWithDamping: 0.33, initialSpringVelocity: 0,
                                   options: [], animations: {
                                    
                        self.loginConstraint.constant = 10.0
                        self.view.layoutIfNeeded()
                  self.showSocialLoginButtons()
        }, completion: nil)
        
        
    }
    
    private func showSocialLoginButtons(){
        UIView.animateWithDuration(0.3, delay: 0.0,
                                   usingSpringWithDamping: 0.33, initialSpringVelocity: 0,
                                   options: [], animations: {
                                    self.socialLoginStack.alpha = 1
                                    self.slTopConstraint.constant = 40
                                    self.view.layoutIfNeeded()
                                    
            }, completion: { finished in
        
        self.slShow()
    })

    
    
    }
    
    private func slShow(){
        UIView.animateWithDuration(0.7, delay: 0.0,
                                   usingSpringWithDamping: 0.33, initialSpringVelocity: 0,
                                   options: [], animations: {
                                    
                                    self.slTopConstraint.constant = 30
                                    self.view.layoutIfNeeded()
                                    self.slSplit()
            }, completion: { finished in
                self.slSplit()
                
        })

    }
    
    private func slHide(){
        UIView.animateWithDuration(0.8, delay: 0.0,
                                   usingSpringWithDamping: 0.33, initialSpringVelocity: 0,
                                   options: [], animations: {
                                    
                                    self.slTopConstraint.constant = self.slTopConstraintConstant
                                    self.socialLoginStack.alpha = 0
                                    self.view.layoutIfNeeded()
                                    
            }, completion: { finished in
                
                self.slCollapse()
        })
        
    }
    
    private func slSplit(){
        UIView.animateWithDuration(0.9, delay: 0.0,
                                   usingSpringWithDamping: 0.33, initialSpringVelocity: 0,
                                   options: [], animations: {
                                    
                                    self.socialLoginStack.spacing = 58

                                    self.view.layoutIfNeeded()
                                    
            }, completion: { finished in
                
               
        })
        
    }
    
    private func slCollapse(){
        UIView.animateWithDuration(0.7, delay: 0.0,
                                   usingSpringWithDamping: 0.33, initialSpringVelocity: 0,
                                   options: [], animations: {
                                    
                                    self.socialLoginStack.spacing = -58
                                    
                                    self.view.layoutIfNeeded()
                                    
            }, completion: { finished in
              
                
        })
    }
}

extension BlurredViewController {
    private func setup(){
        socialLoginStack.alpha = 0
        closeButton.alpha = 0
        loginView.alpha = 0
        loginConstraintConstant = loginConstraint.constant
        slTopConstraintConstant = slTopConstraint.constant
       
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
    
    



