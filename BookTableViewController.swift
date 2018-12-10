//
//  BookTableViewController.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 25/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import Foundation
import UIKit;
import Kingfisher;
class BooksTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var controller: ViewController;
    
    init(_ controller: ViewController) {
        self.controller = controller
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell") as! BookCell
        let book = BooksList.books[indexPath.section];
        if let coverUrl = book.getBookCover() {
            cell.bookCover.kf.setImage(with: URL(string: coverUrl));
        }
        cell.bookTitle.text = book.getTitle();
        cell.bookAuthor.text = book.getAuthor();
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        controller.goToSpecificBook(indexPath.section);
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return BooksList.books.count;
    }
}
