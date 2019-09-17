
# Watch Tutorial on YouTube
https://youtu.be/aG-uy2Hsd3o



# SpriteKitDemo
Demo of spritekit for class.

## Step 0:

Create a project with GAME type, and choose SpriteKit as the game technology.


## Step 1:

Create the view in the view controlleer, where the sprite will appear.

```swift

import UIKit
import SpriteKit

class MainViewController: UIViewController {

  let scene = SKScene(size: skView.bounds.size)

  scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
  
  
  // Import immage through its name/URL
  
  let image = SKSpriteNode(imageNamed: "test.png")
  
  
  //Add the image as a child
  scene.addChild(image)

  override func viewDidLoad() {
    super.viewDidLoad()
    //once the scene has been set up, present it!
    if let skView = self.view as? SKView { 
      skView.presentScene(scene)
    }

  }
  

}

```

the scene variable is created to modify the anchorpoint, witch, in this case has been set to the very middle of the screen.
Then, the image is added to the scene, and finally presented.


## Step 2: Use atlases to improve performance

Swift is designed to use atlases, and as such, they are incredibly easy to implement. Simply create a folder that ends in .atlas, and insert the images you want to use.

https://help.apple.com/xcode/mac/current/#/dev10510b1f7




```swift
import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = view as? SKView {
            // Create the scene programmatically
            let scene = GameScene(size: view.bounds.size)
            scene.scaleMode = .resizeFill
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            view.presentScene(scene)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

```

```swift

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

```


