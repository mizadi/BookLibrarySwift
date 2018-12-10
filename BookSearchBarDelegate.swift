//
//  BookSearchBarDelegate.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 27/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import Foundation
import UIKit;
class BookSearchBarDelegate: NSObject, UISearchBarDelegate {
    
    var controller: ViewController;
    
    init(_ controller: ViewController) {
        self.controller = controller;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder();
        if let searchText = searchBar.text {
            controller.loadBooks(searchText);
        }
    }
}
