//
//  ProteinVC.swift
//  SwiftyProteins
//
//  Created by Ivan OSYPENKO on 9/3/18.
//  Copyright © 2018 iosypenk & mrybak team. All rights reserved.
//

import UIKit
import SceneKit

class ProteinVC: UIViewController {

    @IBOutlet weak var proteinScene: SCNView!
    @IBOutlet weak var atomName: UILabel!
    var pdbfile : String?
    var atoms: Elements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proteinScene.backgroundColor = UIColor.white
        proteinScene.allowsCameraControl = true
        proteinScene.autoenablesDefaultLighting = true
        
        proteinScene.scene = ProteinScene(pdbFile: pdbfile!)
        atomName.text = "Atom name:"
        atoms = GetAtomInfo().getInfo()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: proteinScene)
        let hitList = proteinScene.hitTest(location, options: nil)
        
        if let hitObject = hitList.first {
            if hitObject.node.name != "CONECT" {
            
                for element in (atoms?.elements)! {
                    if (element.symbol?.lowercased() == hitObject.node.name?.lowercased()) {
                        print(element.name!, element.atomic_mass!)
                        print(element.discovered_by!)
                        print(element.summary!)
                        
                    }
                }
                atomName.text = "Atom name: " + (hitObject.node.name ?? "")
            } else {
                atomName.text = atomName.text
            }
        }
    }
}
