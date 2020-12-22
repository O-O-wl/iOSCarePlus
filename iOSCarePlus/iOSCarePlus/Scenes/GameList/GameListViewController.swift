//
//  GameListViewController.swift
//  iOSCarePlus
//
//  Created by dongyoung.lee on 2020/12/16.
//

import Alamofire
import UIKit

final class GameListViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var contents: [NewGame.Content] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        let gameListURL: String = "https://ec.nintendo.com/api/KR/ko/search/new?count=30&offset=0"
        AF.request(gameListURL)
            .responseDecodable(of: NewGame.Response.self) { [weak self] response in
                switch response.result {
                case .success(let response):
                    self?.contents.append(contentsOf: response.contents)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error.errorDescription ?? "")
                }
            }
    }
}

extension GameListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GameItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GameItemTableViewCell", for: indexPath) as! GameItemTableViewCell
        let content: NewGame.Content = contents[indexPath.row]
        let game: Game = Game(title: content.name, imageURL: content.bannerURL, discountPrice: 0, originPrice: 0)
        cell.setModel(game)
        return cell
    }
}

extension GameListViewController: UITableViewDelegate {
}
 
