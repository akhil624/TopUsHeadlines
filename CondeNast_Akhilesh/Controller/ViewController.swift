//
//  ViewController.swift
//  CondeNast_Akhilesh
//
//  Created by Akhilesh Kumar Singh on 08/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewArticles: UITableView!
    
    var presenter = NewsPresenter()
    
    var arrArticle = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.presenter.attachView(view: self)
        self.presenter.getNewsList()
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUI() {
        
        self.navigationItem.title = "Top US Headlines"
        
        self.tableViewArticles.register(UINib.init(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCellIdentifier")
        
        self.tableViewArticles.dataSource = self
        self.tableViewArticles.delegate = self
        self.tableViewArticles.rowHeight = UITableView.automaticDimension
        self.tableViewArticles.estimatedRowHeight = 100
        
    }
}

// MARK: UITAbleView DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCellIdentifier", for: indexPath) as? ArticleTableViewCell {
            cell.bindUI(data: self.arrArticle[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
// MARK: UITAbleView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Move to complete nrews page
        if self.arrArticle.count > indexPath.row {
            if let controller = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailViewController") as? NewsDetailViewController {
                controller.urlNews = self.arrArticle[indexPath.row].url ?? ""
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}

// MARK: API Response
extension ViewController: GenericAPIPresenterView {
    
    func willLoadData() {
        self.showLoader()
    }
    
    func didLoadData<T>(_ obj: T?) {
        self.removeLoader()
        DispatchQueue.main.async { [weak self] in
            if let response = obj as? TopUsHeadlineResponse {
                if let articles = response.articles {
                    self?.arrArticle.removeAll()
                    self?.arrArticle.append(contentsOf: articles)
                    self?.tableViewArticles.reloadData()
                }
            }
        }
    }
    
    func didFailToLoadData<T>(_ message: T?) {
        self.removeLoader()
    }
}
