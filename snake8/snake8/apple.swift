//
//  apple.swift
//  snake8
//
//  Created by Владислав Тихоненков on 06.06.2021.
//

import UIKit
import SpriteKit


// Яблоко


class Apple: SKShapeNode {
    
    
//определяем, как оно будет отрисовываться
    

    convenience init(position : CGPoint) { self.init()
    
// рисуем круг

        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
// заливаем красным
// рамка тоже красная
        fillColor = UIColor.red
        strokeColor = UIColor.red

        // ширина рамки 5 поинтов
        

 lineWidth = 5
        

        self.position = position
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 5, y: 5))
 
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
        
    }
    
    
    
        
    
}
