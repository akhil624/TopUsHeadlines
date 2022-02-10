//
//  ArticleTableViewCell.swift
//  CondeNast_Akhilesh
//
//  Created by Akhilesh Kumar Singh on 08/02/22.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var uiViewBg: UIView!
    @IBOutlet weak var uiImageViewNews: ImageLoader!
    @IBOutlet weak var uiLabelTitle: UILabel!
    @IBOutlet weak var uiViewBgTitle: UIView!
    @IBOutlet weak var uiLabelDescription: UILabel!
    
    @IBOutlet weak var uiViewBgAuthor: UIView!
    @IBOutlet weak var uiLabelAuthor: UILabel!
    
    @IBOutlet weak var uiLabelLike: LabelLoader!
    @IBOutlet weak var uiLabelComment: LabelLoader!
    
    @IBOutlet weak var topSpaceDescription: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ArticleTableViewCell {
    
    func bindUI(data: Article) -> Void {
        
        self.uiLabelTitle.text = data.title ?? ""
        self.uiLabelDescription.text = data.description ?? ""
        
        self.uiViewBgAuthor.isHidden = true
        if let author = data.author {
            self.uiViewBgAuthor.isHidden = false
            self.uiLabelAuthor.text = "Author: " + author
        }
        
        if let url = URL.init(string: data.urlToImage ?? "") {
            self.uiImageViewNews.loadImageWithUrl(url)
        } else {
            self.uiImageViewNews.image = UIImage.init(named: "placeholder")
        }
        
        if let urlA = data.url {
            var id = urlA.replacingOccurrences(of: "https://", with: "")
            id = id.replacingOccurrences(of: "/", with: "-")
            self.uiLabelLike.isHidden = false
            self.uiLabelComment.isHidden = false
            self.uiLabelLike.loadLikeWithID(id)
            self.uiLabelComment.loadCommentsWithID(id)
            self.topSpaceDescription.constant = 36
        } else {
            self.uiLabelLike.isHidden = true
            self.uiLabelComment.isHidden = true
            self.topSpaceDescription.constant = 8
        }
    }
}
