//
//  GameScene.swift
//  AnimatedBearSwift
//
//  Created by Benjamín Ávila Rosas on 9/15/19.
//  Copyright © 2019 Benjamín Avila. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    private var bear = SKSpriteNode()
    private var bearWalkingFrames: [SKTexture] = []
    
    override func didMove(to view: SKView) {
        backgroundColor = .blue
        buildBear()
        animateBear()
    }
    
    func buildBear() {
        let bearAnimatedAtlas = SKTextureAtlas(named: "BearImages")
        var walkFrames: [SKTexture] = []
        
        let numImages = bearAnimatedAtlas.textureNames.count
        for i in 1...numImages {
            let bearTextureName = "bear\(i)"
            walkFrames.append(bearAnimatedAtlas.textureNamed(bearTextureName))
        }
        bearWalkingFrames = walkFrames
        
        let firstFrameTexture = bearWalkingFrames[0]
        bear = SKSpriteNode(texture: firstFrameTexture)
        bear.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(bear)
    }
    
    func animateBear() {
        bear.run(SKAction.repeatForever(SKAction.animate(with: bearWalkingFrames,
                                                         timePerFrame: 0.1,
                                                         resize: false,
                                                         restore: true)),
        withKey: "walkingInPlaceBear")
    }
}
