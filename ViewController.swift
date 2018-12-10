//
//  ViewController.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 25/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import UIKit
import SwiftyJSON;
class ViewController: UIViewController, BookClientDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var booksTableViewController: BooksTableViewController!;
    var bookSearchBarDelegate: BookSearchBarDelegate!;
    var client: BookClinet?;
    var callback: BookClientDelegate!;
    
    var selectedBookIndex = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        setBookClinet();
        setTableView();
        setSearchBar();
    }
    
    func setSearchBar() {
        bookSearchBarDelegate = BookSearchBarDelegate(self);
        searchBar.delegate = bookSearchBarDelegate;
    }
    
    func setTableView() {
        booksTableViewController = BooksTableViewController(self);
        tableView.dataSource = booksTableViewController;
        tableView.delegate = booksTableViewController;
    }
    
    func setBookClinet() {
        client = BookClinet(self);
//        callback = {
//            class NotSoAnonymous : BookClientDelegate {
//                unowned let parent: ViewController
//
//                init(_ controller: ViewController) {
//                    self.parent = controller;
//                }
//
//                func onSuccess(json :JSON) {
//                    BooksList.books = BookParser.buildBooks(json);
//                    DispatchQueue.main.async {
//                        self.parent.tableView.reloadData();
//                    }
//            }
//            func onError(error:Error) {
//                print(error);
//            }
//            }
//            return NotSoAnonymous(self);
//        }();
    }
    
    func loadBooks(_ query: String) {
        client?.getBooks(query: query);
    }
    
    func goToSpecificBook(_ index: Int) {
        self.selectedBookIndex = index;
        performSegue(withIdentifier: "BookListToBook", sender: self);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookListToBook" {
            if let controller = segue.destination as? SpecificBookViewController {
                controller.bookIndex = selectedBookIndex;
            }
        }
    }
    func onError(error: Error) {
        print(error);
    }
    
    func onSuccess() {
        tableView.reloadData();
    }
}

