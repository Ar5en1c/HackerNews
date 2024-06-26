//
//  ViewController.swift
//  HackerNews
//
//  Created by Kuldeep Singh on 6/25/24.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    var viewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        newsTableView.delegate = self
        viewModel.delegate = self
        loadData()
    }


}

extension NewsViewController {
    func loadData() {
        Task {
            do {
                try await viewModel.fetchData()
            } catch {
                print("Error fetching data:", error)
            }
        }
    }
}

extension NewsViewController: NewsDataDelegate {
    func didFetchNewsData() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
}


extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Hacker Newz"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTotalHitsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsTableCell", for: indexPath) as? NewsTableCell else { return UITableViewCell()}
        cell.dataReceived = viewModel.getNewsHit(at: indexPath.row)
        cell.loadData()
        return cell
    }
}
