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
    private var soundEffect: AVAudioPlayer?
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .red
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        turnOn()
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: tableView.topAnchor),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
        ])
    }
    
    func update(_ models: [MusicFile]) {
        
        
    }
    
    func turnOn() {
        let urlString = (try? String(contentsOfFile: "file1")) ?? ""
        
        let url = Bundle.main.url(forResource: urlString,
                                  withExtension: "mp3")
        
        if let url = url {
            do {
                soundEffect = try AVAudioPlayer(contentsOf: url)
                
                guard let sound = soundEffect else { return }
                
                sound.prepareToPlay()
                
                sound.play()
            } catch let error {
                showAlert(
                    title: "파일 실행 실패",
                    message: error.localizedDescription
                )
            }
        } else {
            showAlert(title: "잘못된 파일 경로", message: "")
        }
    }

}
