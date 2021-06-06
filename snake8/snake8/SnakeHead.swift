//
//  SnakeHead.swift
//  snake8
//
//  Created by Владислав Тихоненков on 06.06.2021.
//

import UIKit


class SnakeHead: SnakeBodyPart {
    
    
    
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        // категория - голова
        
        self.physicsBody?.categoryBitMask = CollisionCategories.SnakeHead
        

        // пересекается с телом, яблоком и границей экрана
        
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple | CollisionCategories.Snake
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
}
