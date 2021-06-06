//
//  GameViewController.swift
//  snake8
//
//  Created by Владислав Тихоненков on 04.06.2021.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
// создаем экземпляр сцены
        let scene = GameScene(size: view.bounds.size)

// получаем главную область экрана
        let skView = view as! SKView
    
// включаем отображение fps (количество кадров в секунду)
        skView.showsFPS = true
// показывать количество объектов на экране
        skView.showsNodeCount = true
// включаем произвольный порядок рендеринга объектов в узле
        skView.ignoresSiblingOrder = true
// режим отображения сцены, растягивается на все доступное
    //пространство
        scene.scaleMode = .resizeFill
// добавляем сцену на экран
        skView.presentScene(scene)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
