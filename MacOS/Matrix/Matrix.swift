import Cocoa
import ScreenSaver

class MatrixView: ScreenSaverView {
    
    let width = 128
    let height = 72
    let flips = 5
    let garbage = "1234567890!@#$%^&*()ZXCVBNM<>?"
    
    var count = 0
    var switches = [Int](count:width, repeatedValue:1)
    
    let attributes = [
        NSForegroundColorAttributeName:NSColor.greenColor()
    ]
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        super.animationTimeInterval = 1/30.0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func startAnimation() {
        super.startAnimation()
    }
    
    override func stopAnimation() {
        super.stopAnimation()
    }
    
    override func drawRect(rect: NSRect) {
        super.drawRect(rect)
    }
    
    override func animateOneFrame() {
        for i in 0 ... flips {
            let x = arc4random_uniform(UInt32(width))
            if (switches[x] == 0) {
                switches[x] = 1
            } else {
                switches[x] = 0
            }
        }
        
        
        
        let t = "test"
        t.drawInRect(NSMakeRect(100, 100, 100,100), withAttributes: attributes)
    }
    
    override func hasConfigureSheet() -> Bool {
        return false
    }
    
    override func configureSheet() -> NSWindow? {
        return nil
    }
}
