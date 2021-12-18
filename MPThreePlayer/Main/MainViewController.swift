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
        tableView.delegate = self
        return tableView
    }()
    private lazy var dataSource: MainDiffableDataSource = {
        tableView.register(MusicListCell.self, forCellReuseIdentifier: "MusicListCell")
        return MainDiffableDataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "MusicListCell", for: indexPath) as? MusicListCell
            
            cell?.configure(item)
            
            return cell ?? UITableViewCell()
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        turnOn()
        setupViews()
        setDataSource()
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
    
    let repository = ListeningFilesRepository()
    private func setDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<MainSection, MusicFile>()
        snapshot.appendSections([.main])
        snapshot.appendItems(repository.musicModels, toSection: .main)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func update(_ models: [MusicFile]) {
        
        
    }
    
    func turnOn(file: MusicFile) {
        do {
            guard let path = file.url else {
                return
            }
            
            print("url: \(path)")
            soundEffect?.stop()
            soundEffect = nil
            soundEffect = try AVAudioPlayer(contentsOf: path)
            
            guard let sound = soundEffect else { return }
            
            sound.prepareToPlay()
            
            sound.play()
        } catch let error {
            showAlert(
                title: "파일 실행 실패",
                message: error.localizedDescription
            )
        }
    }

}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        turnOn(file: repository.musicModels[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}
