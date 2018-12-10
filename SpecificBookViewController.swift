//
//  SpecificBookViewController.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 28/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import Foundation
import UIKit;
class SpecificBookViewController: UIViewController {
    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    var bookIndex: Int = 0;
    var book: Book!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setBackButton();
        book = BooksList.books[bookIndex];
        bookTitle.text = book.getTitle();
        bookAuthor.text = book.getAuthor();
        bookCoverImageView.kf.setImage(with: URL(string: book.getBookCover()!));
        bookCoverImageView.contentMode = .scaleAspectFit;
        
    }
    
    func setBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    @objc func dismissViewController() {
        self.dismissViewController();
    }
}
