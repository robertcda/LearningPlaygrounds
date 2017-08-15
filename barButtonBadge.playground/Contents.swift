//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport
import CoreGraphics

var str = "Hello, playground"

class BadgeBarButtonItem:UIBarButtonItem{
    
    enum Constants{
        enum BarButtonItem{
            static let width:CGFloat = 40
            static let height:CGFloat = 40
            
            static var size: CGSize{
                    return CGSize(width: width, height: height)
            }
            
            static let imageTintColor = UIColor.white
        }
        enum Badge{
            
            // Origin
            static let xOffset:CGFloat = 25
            static let yOffset:CGFloat = -7
            
            static var origin: CGPoint{
                return CGPoint(x: xOffset, y: yOffset)
            }

            // Size
            static let width:CGFloat = 23
            static let height:CGFloat = 23
            
            static var size: CGSize{
                return CGSize(width: width, height: height)
            }
            
            //Color
            static let bgColor = UIColor.white
            static let textColor = UIColor.black

        }
    }
    
    var badgeLabel: UILabel? = nil
    
    convenience init(image:UIImage, initialCount:Int = 0){
        
        let button: UIButton = UIButton(type: .system)
        
        // Set the size of the button
        button.frame = CGRect(origin: CGPoint.zero,
                              size: Constants.BarButtonItem.size)

        // Set the Image to be shown
        let imageVw = UIImageView(frame: CGRect(origin: CGPoint.zero,
                                                size: Constants.BarButtonItem.size))
        
        let templateImage = image.withRenderingMode(.alwaysTemplate)
        imageVw.image = templateImage
        imageVw.tintColor = Constants.BarButtonItem.imageTintColor
        
        button.addSubview(imageVw)
        
        // Configure the button action/selector
        
        
        // Configure the badge 
        let label = UILabel(frame: CGRect(origin: Constants.Badge.origin,
                                          size: Constants.Badge.size))
        
        label.layer.cornerRadius = label.frame.width/2
        label.layer.masksToBounds = true
        label.textAlignment = .center
        
        label.backgroundColor = Constants.Badge.bgColor
        label.textColor = Constants.Badge.textColor
        
        button.addSubview(label)
 
        self.init(customView: button)
        badgeLabel = label
        setBadgeNumber(badgeCount: initialCount)
    }
    
    func setBadgeNumber(badgeCount:Int){
        if badgeCount == 0{
            badgeLabel?.isHidden = true
        }else{
            badgeLabel?.isHidden = false
        }
        badgeLabel?.text = "\(badgeCount)"
    }
}


let barButtonItem = BadgeBarButtonItem(image:#imageLiteral(resourceName: "setting.png"),initialCount:1)


let navigationItem = UINavigationItem(title: "Hello")
let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 200, height: 50))

navigationBar.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.5411086679, blue: 0.7530040741, alpha: 1)

navigationItem.leftBarButtonItem = barButtonItem

navigationBar.items = [navigationItem]
PlaygroundPage.current.liveView = navigationBar
