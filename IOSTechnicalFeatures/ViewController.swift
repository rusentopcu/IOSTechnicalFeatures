//
//  ViewController.swift
//  IOSTechnicalFeatures
//
//  Created by Rusen Topcu on 19.02.2020.
//  Copyright © 2020 Rusen Topcu. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - View Controller'da hangi mode'un kullanılacağını belirliyoruz. Seçime bakılmaksızın Şart haline getirir.(info.plist: User Interface Style Dark yada Light ile de güncelleyebiliriz).
        overrideUserInterfaceStyle = .light
        
    
    }


    //MARK: - Uygulama açıkken kullanıcının yaptığı mode değişikliğini algılaması için (Dark,Light) bu func. kullanıldı.
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            let userInterfaceStyle = traitCollection.userInterfaceStyle
            if userInterfaceStyle == .dark {
                changeButton.tintColor = UIColor.white
            }
            else {
                changeButton.tintColor = UIColor.blue
            }
    }
    
    
    @IBAction func signButton(_ sender: Any) {
        //Authentication için LAContext'ten nesne üreteceğiz bunun için önce LocalAuthentication import edilmelidir. Ayrıca info.plist'te Privacy-Face ID Usage Description girilmelidir.
        
        let authContex = LAContext()
        var error: NSError?
        if authContex.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContex.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "FaceID true?") { (success, error) in
                if success == true {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                  }
                } else {
                    DispatchQueue.main.async {
                        self.myLabel.text = "Error!"
                    }
                    
                }
            }
        }
        
    }
}



