//
//  NewsViewModel.swift
//  HackerNews
//
//  Created by Kuldeep Singh on 6/25/24.
//

import Foundation

class NewsViewModel {
    weak var delegate: NewsDataDelegate?
    private var newsInfoList: [Hit] = []
    
    func fetchData() async throws {
        do {
            let newsResult: NewsData = try await ApiManager.shared.fetchDataAsJSON(url: Constants.newUrl.rawValue )
            self.newsInfoList = newsResult.hits ?? []
            self.delegate?.didFetchNewsData()
        } catch {
            print("Error: During fetching data from the view model")
        }
    }
    
    func getTotalHitsCount() -> Int{
        return newsInfoList.count
    }
    
    func getNewsHit(at index: Int) -> Hit? {
        guard index >= 0 && index < newsInfoList.count else {
            return nil
        }
        return newsInfoList[index]
    }
}
