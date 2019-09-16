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


```swift



```
