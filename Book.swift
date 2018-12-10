//
//  Book.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 25/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import Foundation
import SwiftyJSON;
class Book {
    private var title: String!;
    private var author: String!;
    private var bookCover: String!;
    
    func getTitle() -> String {
        return title;
    }
    
    func getAuthor() -> String {
        return author;
    }
    
    func setTitle(_ title: String) {
        self.title = title;
    }
    
    func setAuthor(_ author: String) {
        self.author = author;
    }
    
    func setBookCover(_ cover: String) {
        self.bookCover = cover;
    }

    func getAuthor(_ authors: [String: Any]) -> String {
        var authorString = "";
        for author in authors {
            authorString = "\(authorString) , \(author)"
        }
        return authorString;
    }
    
    func getBookCover() -> String? {
        if bookCover.count > 0 {
            return "http://covers.openlibrary.org/b/olid/\(bookCover!)-M.jpg?default=false";
        }
        return nil;
    }
    

}
