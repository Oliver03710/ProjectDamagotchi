//
//  UIViewController+Extension.swift
//  ProjectDamagotchi
//
//  Created by Junhee Yoon on 2022/08/02.
//

import UIKit

extension UIViewController {
    
    func showAlert(alertText : String, alertMessage : String, buttonName: String) {
        
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonName, style: .default) { action -> Void in
            
            UserdefaultsHelper.standard.reset()
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as? ChoiceCollectionViewController else { return }
            let nav = UINavigationController(rootViewController: vc)
            
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(alertText : String, alertMessage : String, buttonName: String, cancelButton: String) {
        
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonName, style: .default) { action -> Void in
            
            if let appDomain = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
            }
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: StoryboardName.main.rawValue, bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: ChoiceCollectionViewController.identifier) as? ChoiceCollectionViewController else { return }
            let nav = UINavigationController(rootViewController: vc)
            
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
            
            nav.view.alpha = 0.0
            UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut]) {
                nav.view.alpha = 1.0
            }
        })
        
        alert.addAction(UIAlertAction(title: cancelButton, style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func transitionViewController<T: UIViewController>(storyboard: String, viewController vc: T.Type) {
        
        let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let controller = sb.instantiateViewController(withIdentifier: String(describing: vc)) as? T else { return }
//        self.present(controller, animated: true)
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}
