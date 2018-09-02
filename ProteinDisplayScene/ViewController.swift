//
//  ViewController.swift
//  ProteinDisplayScene
//
//  Created by Maxym RYBAK on 02.09.2018.
//  Copyright © 2018 Maxym RYBAK. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scnView = self.view as! SCNView
        
        scnView.backgroundColor = UIColor.black
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        
        let filename = Bundle.main.path(forResource: "001_model", ofType: "pdb")
        do {
            let content = try NSString(contentsOfFile: filename!, encoding: String.Encoding.utf8.rawValue) as String
            let scene = ProteinScene(str: content)
            scnView.scene = scene
        } catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
        
    }
}

