//
//  General.swift
//  Mahally
//
//  Created by Rovan Mohamed on 6/19/19.
//  Copyright © 2019 Eman Gaber. All rights reserved.
//

import UIKit

class General: NSObject {
   var tabBarController : UITabBarController = UITabBarController()

    static let sharedInstance = General()
    private override init()
    {
        super.init()
        
    }
    
    var PlayerView : CustomeTapBarViewController?

    
    
    class func compressImage(image:UIImage) -> Data {
        // Reducing file size to a 10th
        
        var actualHeight : CGFloat = image.size.height
        var actualWidth : CGFloat = image.size.width
        let maxHeight : CGFloat = 1136.0
        let maxWidth : CGFloat = 640.0
        var imgRatio : CGFloat = actualWidth/actualHeight
        let maxRatio : CGFloat = maxWidth/maxHeight
        var compressionQuality : CGFloat = 0.5
        
        if (actualHeight > maxHeight || actualWidth > maxWidth){
            if(imgRatio < maxRatio){
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight;
                actualWidth = imgRatio * actualWidth;
                actualHeight = maxHeight;
            }
            else if(imgRatio > maxRatio){
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth;
                actualHeight = imgRatio * actualHeight;
                actualWidth = maxWidth;
            }
            else{
                actualHeight = maxHeight;
                actualWidth = maxWidth;
                compressionQuality = 1;
            }
        }
        
        let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
        
        UIGraphicsBeginImageContext(rect.size);
        image.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext();
        let imageData = img!.jpegData(compressionQuality: compressionQuality)
        UIGraphicsEndImageContext();
        
        return imageData!
    }
    class func CreateCustomeTapBar()
        //->  CustomeTapBarViewController
    {

        let objGeneral = General.sharedInstance
        

        if (objGeneral.PlayerView != nil)
        {
            objGeneral.PlayerView!.view.removeFromSuperview()
        
        }
        
        let mainWindow = UIWindow(frame: UIScreen.main.bounds)
        
        var Identifier: String
        
//        if ArabicLang != nil {
//            Identifier = "customeTabBar6"
//        } else {
            Identifier = "CutomeTabBar"
//        }
        
        let contentView = Bundle.main.loadNibNamed(Identifier, owner: self, options: nil)?[0] as? CustomeTapBarViewController
        
        
        contentView?.view.frame = CGRect(x: 0.0, y: mainWindow.frame.size.height - 85, width: mainWindow.frame.size.width, height: 85)

        objGeneral.PlayerView = contentView
        
        
        let keyWindow = UIApplication.shared.delegate?.window
        
//        .filter({$0.activationState == .foregroundActive})
//        .map({$0 as? UIWindowScene})
//        .compactMap({$0})
//        .first?.windows
//        .filter({$0.isKeyWindow}).first
        
        keyWindow!!.addSubview(objGeneral.PlayerView!.view)
        
//        return objGeneral.PlayerView!

    }
    
    
    class func getPlayerView() ->  CustomeTapBarViewController
 {
    return General.sharedInstance.PlayerView!
    }
    
    class func RemoveOptional(url : String) -> String {
        
        let urlNew = url.replacingOccurrences(of: "Optional(", with: "", options: .literal, range: nil)
        
        let urlNew2 = urlNew.replacingOccurrences(of: ")", with: "", options: .literal, range: nil)
        
        let urlNew3 = urlNew2.replacingOccurrences(of: "\"", with: "", options: .literal, range: nil)
        
        return urlNew3;
    }
    
    class func validateEmail( email: String?) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
        
    }
    
    class func hexStringToUIColor (hex:String) -> UIColor
    {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
    class func createGradientColor(theView: UIView)
    {
        
        let topColor  = UIColor.white
        let endColor  = General.hexStringToUIColor(hex: "#B4B4B4")
        let gradient = CAGradientLayer()
        
        let colours = [topColor.cgColor, endColor.cgColor]
        
        
        gradient.colors = colours.map { $0 }
        
        gradient.locations = [0.0 , 1.0]
        gradient.endPoint = CGPoint(x: 1, y: 2)
        gradient.startPoint =  CGPoint(x: 0.0, y: 0.0)
        gradient.cornerRadius = 2
        gradient.frame = CGRect(x: 0, y: 0, width: theView.frame.size.width * 1.5 , height: theView.frame.size.height)
        
        
        //
        theView.clipsToBounds = true
        
        //
        theView.layer.insertSublayer(gradient, at: 0)
        
    }
    
    class func borderView(x : UIView) {
        x.layer.borderWidth = 1
        x.layer.borderColor = hexStringToUIColor(hex: "#96694C").cgColor
        x.layer.cornerRadius = 5
        x.clipsToBounds = true
    }
    class func roundedLabels(x : UILabel) {
        x.layer.borderWidth = 1
        x.layer.borderColor = hexStringToUIColor(hex: "#96694C").cgColor
        x.layer.cornerRadius = x.frame.size.width/2
        x.clipsToBounds = true
    }
    
    class func showToastMessage(Onview: UIView , message : String)
    {
        let mainWindow :UIWindow = UIWindow.init(frame: UIScreen.main.bounds)
        
        let toastLabel = UILabel(frame: CGRect(x: mainWindow.frame.size.width/2 - 75, y: mainWindow.frame.size.height - 120, width: 150, height: 35))
        
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 0.8
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        Onview.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1.3, delay: 1.3, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.8
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
        
    }
    
    class func stringForKey(key : String) -> String
    {
        
        var currentMainBundle :Bundle
        switch (UserDefaults.standard.string(forKey: "keyLanguage"))
        {
            
        case "ar"?:
            let path = Bundle.main.path(forResource: "ar", ofType: "lproj")
            
            currentMainBundle = Bundle(path: path!)!
            
            return currentMainBundle.localizedString(forKey: key, value:"key not found" , table: nil)
            
        case "en"?:
            
            
            let path = Bundle.main.path(forResource: "en", ofType: "lproj")
            
            currentMainBundle = Bundle(path: path!)!
            
            return  currentMainBundle.localizedString(forKey: key, value:"key not found" , table: nil)
            
            
        default:
            let path = Bundle.main.path(forResource: "ar", ofType: "lproj")
            
            currentMainBundle = Bundle(path: path!)!
            
            currentMainBundle.localizedString(forKey: key, value:"key not found" , table: nil)
            
            return   currentMainBundle.localizedString(forKey: key, value:"key not found" , table: nil)
        }
        
        
    }
    
    class  func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
    
    
    
    class func CurrentDeviceLanguage() -> String {
        
        let returnL : String = UserDefaults.standard.object(forKey: "DeviceLanguage") as! String
        
        if returnL.range(of:"en") != nil {
            return "en"
        }else
            if returnL.range(of:"ar") != nil {
                return "ar"
            }else
            {
                return "ar"
        }
        
    }
    
    
    
    class func CurrentLanguage() -> String {
        let returnL : String = UserDefaults.standard.object(forKey: "keyLanguage") as! String
        
        print(returnL)
        if returnL.range(of:"en") != nil {
            return "en"
        }else
            if returnL.range(of:"ar") != nil {
                return "ar"
            }else{
                return "ar"
                
        }
    }
    
}

