//
//  MainViewController.swift
//  MPThreePlayer
//
//  Created by devming on 2021/12/06.
//

import ModernRIBs
import UIKit
import AVFoundation

protocol MainPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {

    weak var listener: MainPresentableListener?
    var soundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        c()
    }
    
    func c() {
        let url = Bundle.main.url(forResource: "file1", withExtension: "mp3")
        
        if let url = url{
            do {
                soundEffect = try AVAudioPlayer(contentsOf: url)
                
                guard let sound = soundEffect else { return }
                
                sound.prepareToPlay()
                
                sound.play()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

}
