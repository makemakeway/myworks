//
//  SceneDelegate.swift
//  RisingcampWeek2
//
//  Created by 박연배 on 2021/09/18.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appSwitcherView: UIView?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
    }

    // 현재 보고 있는 뷰의 스크린샷을 만드는 함수
    func createScreenshotOfCurrentContext() -> UIImage? {
        UIGraphicsBeginImageContext(self.window?.screen.bounds.size ?? CGSize())
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            return nil
        }
            
        self.window?.layer.render(in: currentContext)
            
        let image = UIGraphicsGetImageFromCurrentImageContext()
            
        UIGraphicsEndImageContext()
            
        return image
    }
    
    // 가우시안블러 효과를 적용시키는 함수
    func applyGaussianBlur(on image: UIImage, withBlurFactor blurFactor : CGFloat) -> UIImage? {
        guard let inputImage = CIImage(image: image) else {
            return nil
        }
            
        // Add a comment where to find documentation for that
        let gaussianFilter = CIFilter(name: "CIGaussianBlur")
            gaussianFilter?.setValue(inputImage, forKey: kCIInputImageKey)
            gaussianFilter?.setValue(blurFactor, forKey: kCIInputRadiusKey)
            
        guard let outputImage = gaussianFilter?.outputImage else {
            return nil
        }
            
        return UIImage(ciImage: outputImage)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        appSwitcherView?.removeFromSuperview()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
        let placeholder = UIImage(named: "placeholder")
        appSwitcherView = UIImageView(image: placeholder)
        appSwitcherView?.frame = window?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        self.window?.addSubview(appSwitcherView!)
        
//        // First apply the Gaussian blur on the screenshot of the current view.
//        let blurredImage = applyGaussianBlur(on: createScreenshotOfCurrentContext() ?? UIImage(), withBlurFactor: 4.5)
//        // Create the UIImageView for the blurred screenshot.
//        appSwitcherView = UIImageView(image: blurredImage)
//        // Set it as the current screen
//        self.window?.addSubview(appSwitcherView!)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

