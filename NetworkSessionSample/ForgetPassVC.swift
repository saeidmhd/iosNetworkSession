//
//  ForgetPassVC.swift
//  NetworkSessionSample
//
//  Created by Saeid.mhd@gmail on 5/7/17.
//  Copyright © 2017 Saeid mohammadi. All rights reserved.
//

import UIKit

class ForgetPassVC: UIViewController,XMLParserDelegate,URLSessionDataDelegate,URLSessionDelegate,UITextFieldDelegate {
    
    var userObject: retrieve_Base! = nil
    static var jsonStr : String?
    var MyuserObject: retrieve_Base! = nil

    @IBOutlet weak var username: UITextField!
    
    var currentElementName:String = ""
    var elementValue: String = ""
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var Cancel: UIButton!
    
    
    @IBOutlet weak var SendPass: UIButton!
    
    @IBAction func SendPass(_ sender: UIButton) {
        
        sender.setTitleColor(UIColor.brown, for: UIControlState.highlighted)
        
        //loginBtn.layer.borderColor = UIColor.brown.cgColor
        
        if self.username.text == ""  {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "خطا", message: "لطفا ایمیل خود را وارد کنید", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "باشه!", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
            
        }else {
            
            makeGetCall(username: self.username.text!)
            // print(MyuserObject!.userInfo![0].firstName!)
            
            
        }
        
        
        
        
    }
    
    func startHighlight(sender: UIButton) {
        sender.layer.borderColor = UIColor.brown.cgColor
        
    }
    func stopHighlight(sender: UIButton) {
        sender.layer.borderColor = UIColor.white.cgColor
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        Cancel.addTarget(self, action: #selector(startHighlight), for: .touchDown)
        Cancel.addTarget(self, action: #selector(stopHighlight), for: .touchUpInside)
        Cancel.addTarget(self, action: #selector(stopHighlight), for: .touchUpOutside)
        
        
        SendPass.addTarget(self, action: #selector(startHighlight), for: .touchDown)
        SendPass.addTarget(self, action: #selector(stopHighlight), for: .touchUpInside)
        SendPass.addTarget(self, action: #selector(stopHighlight), for: .touchUpOutside)
        
        
        let username_border = CALayer()
        let username_width = CGFloat(2.0)
        username_border.borderColor = UIColor.white.cgColor
        username_border.frame = CGRect(x: 0, y: username.frame.size.height - username_width, width:  username.frame.size.width, height: username.frame.size.height)
        username_border.borderWidth = username_width
        username.layer.addSublayer(username_border)
        username.layer.masksToBounds = true
        
        username.returnKeyType = .done
        username.keyboardType = UIKeyboardType.emailAddress
        username.delegate = self;
        
        
        
        SendPass.backgroundColor = .clear
        SendPass.layer.cornerRadius = 22
        SendPass.layer.borderWidth = 2
        SendPass.layer.borderColor = UIColor.white.cgColor
        //  loginBtn.contentHorizontalAlignment = .center
        SendPass.contentVerticalAlignment = .center
        
        
        Cancel.backgroundColor = .clear
        Cancel.layer.cornerRadius = 22
        Cancel.layer.borderWidth = 2
        Cancel.layer.borderColor = UIColor.white.cgColor
        //  loginBtn.contentHorizontalAlignment = .center
        Cancel.contentVerticalAlignment = .center
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func makeGetCall(username:String) {
        
        
        let AppSign = "05b14e27-f2cd-4329-8269-cbc62b182e78"
        let jsonString = "[{\"UserName\":\"" + username + "\"}]";
        
        let methodName = "ForgetPassword"
        
        let text = String(format: "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body><%@ xmlns='http://tempuri.org/'><AppSign>%d</AppSign><jsonString>%@</jsonString></%@></soap:Body></soap:Envelope>", methodName, AppSign, jsonString, methodName)
        
        let url = URL(string: "http://login.mahaksoft.com/loginservices.asmx?op=ForgetPassword")
        
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
        
        ForgetPassVC.jsonStr = elementValue
        
        var dictonary:NSDictionary?
        
        if let data = ForgetPassVC.jsonStr?.data(using: String.Encoding.utf8) {
            
            do {
                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                
                if let dictonary = dictonary
                {
                    let userObject = retrieve_Base(dictionary:dictonary)
                    
                    
                    DispatchQueue.main.async {
                        
                        // self.FirstName.text = userObject!.userInfo![0].firstName!
                        // self.FirstName.textAlignment = .right
                        
                        self.indicator.stopAnimating()
                        self.MyuserObject = userObject
                        
                        if self.MyuserObject!.result! == "True"{
                            
                            print(self.MyuserObject!.result!)
                            
                            
                            let alertController = UIAlertController(title: "ارسال رمز", message: self.MyuserObject!.msg!, preferredStyle: .alert)
                            
                            let defaultAction = UIAlertAction(title: "ممنون!", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                    
                            
                        } else {
                            
                            
                            //Tells the user that there is an error and then gets firebase to tell them the error
                            let alertController = UIAlertController(title: "خطا", message: "کاربری با این مشخصات ثبت نشده است", preferredStyle: .alert)
                            
                            let defaultAction = UIAlertAction(title: "فهمیدم!", style: .cancel, handler: nil)
                            alertController.addAction(defaultAction)
                            
                            self.present(alertController, animated: true, completion: nil)
                            self.username.text = ""
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
        if currentElementName == "ForgetPasswordResult" {
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
    
   // func textFieldDidBeginEditing(_ textField: UITextField) {
  //      self.animateTextField(textField: textField, up:true)
 //   }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if username.text == "" {
            username.textAlignment = .right
            username.placeholder="شناسه محک/ایمیل/شماره بسته"
        }
        
       // self.animateTextField(textField: textField, up:false)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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