//
//  NewsPresenter.swift
//  News
//
//  Created by Akhilesh Kumar Singh on 08/02/22.
//

import Foundation

final class NewsPresenter {
    
    init() { }
    
    var presenterView: GenericAPIPresenterView?
    
    func attachView(view: GenericAPIPresenterView) -> Void {
        self.presenterView = view
    }
    
    func detachView() -> Void {
        self.presenterView = nil
    }
}

extension NewsPresenter {
    
    // Get News List from server
    func getNewsList() {
        
        self.presenterView?.willLoadData()
        
        APIHelper.getAction(APIs.topBusinessUsHeadlines, TopUsHeadlineResponse.self) { success, result in
            if success == true {
                if (result?.status ?? "") == "ok" {
                    self.presenterView?.didLoadData(result)
                } else {
                    self.presenterView?.didFailToLoadData("Status is not Ok.")
                }
            } else {
                self.presenterView?.didFailToLoadData("Unable toload data!")
            }
        }
    }
}
