//
//  DemoNavigationController.swift
//  UIDemoFrontDesk
//
//  Created by Raj Maurya on 31/10/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import UIKit

class DemoNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationView()
  //  self.navigationController!.navigationBar.isTranslucent = true
    
    }
    
    func setNavigationView(){
        let customView =  NavigationBar(frame: CGRect(x: 0, y: -35, width: UIScreen.main.bounds.size.width, height: 80))
        customView.backgroundColor =   UIColor.init(red: 196/255.0, green: 118/255.0, blue: 118/255.0, alpha: 0.2)
//        customView.leftButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        self.navigationBar.addSubview(customView)
    }
    
    @objc func  backButtonAction(){
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
