//
//  ViewController.swift
//  IOSTechnicalFeatures
//
//  Created by Rusen Topcu on 19.02.2020.
//  Copyright © 2020 Rusen Topcu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - View Controller'da hangi mode'un kullanılacağını belirliyoruz. Seçime bakılmaksızın Şart haline getirir.(info.plist: User Interface Style Dark yada Light ile de güncelleyebiliriz).
        overrideUserInterfaceStyle = .dark
    
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
    
    
}

