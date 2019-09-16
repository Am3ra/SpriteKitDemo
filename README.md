# SpriteKitDemo
Demo of spritekit for class.


## Step 1:

Create The main view controller, and create the view, where the sprite will appear.

```swift

import UIKit
import SpriteKit

class MainViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    if let view = view as? SKView {
      // Create the scene programmatically
      let scene = GameScene(size: view.bounds.size)
      scene.scaleMode = .resizeFill
      view.ignoresSiblingOrder = true
    }
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
}

```


## Step 2:


```swift



```
