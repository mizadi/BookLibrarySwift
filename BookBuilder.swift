//
//  BookBuilder.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 25/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import Foundation
class BookBuilder {
    private var book: Book;
    
    init() {
        self.book = Book();
    }
    
    func set(title: String) -> BookBuilder{
        book.setTitle(title);
        return self;
    }
    
    func set(author: String) -> BookBuilder {
        book.setAuthor(author);
        return self;
    }
    
    func set(bookCover: String) -> BookBuilder {
        book.setBookCover(bookCover);
        return self;
    }
    
    func build() -> Book{
        return book;
    }
}
