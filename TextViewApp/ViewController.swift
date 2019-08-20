//
//  ViewController.swift
//  TextViewApp
//
//  Created by Andy Hong on 2019-08-20.
//  Copyright © 2019 triOS College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textView: UITextView!
    @IBOutlet var buttonObject: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        textView.isEditable = false
        textView.isSelectable = true
        textView.text = "This is an example of clickable text www.yahoo.com"
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        if textView.isEditable == true
        {
            textView.isEditable = false
            textView.backgroundColor = UIColor.yellow
            textView.textColor =  UIColor.blue
            textView.font = UIFont(name:"Ariel", size: 24)
        }
        else{
            
            textView.isEditable = true
            textView.backgroundColor = UIColor.orange
            textView.textColor =  UIColor.gray
            textView.font = UIFont(name:"Ariel", size: 10)        }
        
    }
    

}

