//
//  ViewController.swift
//  NetworkSessionSample
//
//  Created by Saeid.mhd@gmail on 4/15/17.
//  Copyright © 2017 Saeid mohammadi. All rights reserved.
//

import UIKit

class ViewController: UIViewController,XMLParserDelegate,URLSessionDataDelegate,URLSessionDelegate,UITextFieldDelegate {
    
    
    // @IBOutlet weak var idicator: UIActivityIndicatorView!
    
    var userObject: Json4Swift_Base! = nil
    var MyuserObject: Json4Swift_Base! = nil
    static var jsonStr : String?
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var FirstName: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        if self.username.text == "" || self.password.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "خطا", message: "لطفا ایمیل و رمز عبور خود را وارد کنید", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "باشه!", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }else {
            
            makeGetCall(username: self.username.text!,password: self.password.text!)
            // print(MyuserObject!.userInfo![0].firstName!)
            
            
            
        }
        
    }
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var username: UITextField!
    
    
    
    var currentElementName:String = ""
    var elementValue: String = ""
    var parser = XMLParser()
    var expectedContentLength = 0
    var buffer:NSMutableData = NSMutableData()
    var placeholder : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  makeGetCall()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let pass_border = CALayer()
        let pass_width = CGFloat(2.0)
        pass_border.borderColor = UIColor.white.cgColor
        pass_border.frame = CGRect(x: 0, y: password.frame.size.height - pass_width, width:  password.frame.size.width, height: password.frame.size.height)
        pass_border.borderWidth = pass_width
        password.layer.addSublayer(pass_border)
        password.layer.masksToBounds = true
        password.returnKeyType = .done
        password.delegate = self;
        
        
        let username_border = CALayer()
        let username_width = CGFloat(2.0)
        username_border.borderColor = UIColor.white.cgColor
        username_border.frame = CGRect(x: 0, y: username.frame.size.height - username_width, width:  username.frame.size.width, height: username.frame.size.height)
        username_border.borderWidth = username_width
        username.layer.addSublayer(username_border)
        username.returnKeyType = .next
        username.layer.masksToBounds = true
        username.delegate = self;
        
        
        
        
        
        loginBtn.backgroundColor = .clear
        loginBtn.layer.cornerRadius = 15
        loginBtn.layer.borderWidth = 2
        loginBtn.layer.borderColor = UIColor.white.cgColor
        //  loginBtn.contentHorizontalAlignment = .center
        loginBtn.contentVerticalAlignment = .center
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func makeGetCall(username:String, password:String) {
        
        
        let AppSign = "05b14e27-f2cd-4329-8269-cbc62b182e78"
        let jsonString = "[{\"Username\":\"" + username + "\",\"Password\":\"" + password + "\"}]";
        
        let methodName = "ValidateUser"
        
        let text = String(format: "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body><%@ xmlns='http://tempuri.org/'><AppSign>%d</AppSign><jsonString>%@</jsonString></%@></soap:Body></soap:Envelope>", methodName, AppSign, jsonString, methodName)
        
        let url = URL(string: "http://login.mahaksoft.com/loginservices.asmx?op=ValidateUser")
        
        let soapMessage = text
        let msgLength = String(describing: soapMessage.characters.count)
        var request = URLRequest(url: url!)
        
        request.addValue("text/xml; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue(msgLength, forHTTPHeaderField: "Content-Length")
        request.httpMethod = "POST"
        request.httpBody = soapMessage.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        let session = URLSession.shared // or let session = URLSession(configuration: URLSessionConfiguration.default)
        
        self.indicator.startAnimating()
        
        
        
        let task =  session.dataTask(with: request) { (data, resp, error) in
            
            
            if let data = data {
                
                
                let xmlParser = XMLParser(data: data as Data)
                xmlParser.delegate = self
                xmlParser.parse()
            }
        }
        
        task.resume()
        
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        self.elementValue = "";
        currentElementName = elementName
    }
    
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
        ViewController.jsonStr = elementValue
        
        var dictonary:NSDictionary?
        
        if let data = ViewController.jsonStr?.data(using: String.Encoding.utf8) {
            
            do {
                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                
                if let dictonary = dictonary
                {
                    let userObject = Json4Swift_Base(dictionary:dictonary)
                    
                    
                    DispatchQueue.main.async {
                        
                        // self.FirstName.text = userObject!.userInfo![0].firstName!
                        // self.FirstName.textAlignment = .right
                        
                        self.indicator.stopAnimating()
                        self.MyuserObject = userObject
                        
                        if self.MyuserObject!.result! == "True"{
                            
                            print(self.MyuserObject!.result!)
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultView")
                            self.present(vc!, animated: true, completion: nil)
                            
                        } else {
                            
                            
                            //Tells the user that there is an error and then gets firebase to tell them the error
                            let alertController = UIAlertController(title: "خطا", message: "کاربری با این مشخصات ثبت نشده است", preferredStyle: .alert)
                            
                            let defaultAction = UIAlertAction(title: "فهمیدم!", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            
                            self.present(alertController, animated: true, completion: nil)
                            self.username.text = ""
                            self.password.text = ""
                            self.username.becomeFirstResponder()
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                    
                }
            } catch let error as NSError {
                print(error)
            }
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if currentElementName == "ValidateUserResult" {
            self.elementValue += string
        }
    }
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if username.text == "" {
        }
        username.textAlignment = .left
        username.placeholder=""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if username.text == "" {
            username.textAlignment = .right
            username.placeholder="شناسه محک/ایمیل/شماره بسته"
        }
    }
    
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        MyuserObject = userObject
    }
    
    func isEmailValid(email: String) -> Bool {
        
        return (email.lowercased().range(of:"@") != nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username.resignFirstResponder()
        if textField == username { // Switch focus to other text field
            password.becomeFirstResponder()
        }else if textField == password{
            
            password.resignFirstResponder()
            
        }
        return true
    }
    
    
}



