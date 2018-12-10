//
//  BookParser.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 25/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import Foundation
import SwiftyJSON;
class BookParser {
    private static func buildBook(_ json: JSON) -> Book? {
        print(json);
        var tempCover = "";
        guard let title = json["title_suggest"].string
            else {return nil}
        guard let author = json["author_name"].array
            else {return nil}
        if let cover = json["cover_edition_key"].string {
            tempCover = cover;
        }
        let authorString = buildAuthorsString(author);
        let book = BookBuilder()
            .set(title: title)
            .set(author: authorString)
            .set(bookCover: tempCover)
            .build();
        return book;
    }
    
    private static func buildAuthorsString(_ authorArray: [JSON] ) -> String{
        var authorString = "";
        if authorArray.count > 1 {
        for (index,author) in authorArray.enumerated() {
            if index == 0 {
                authorString = "\(author)";
            } else {
                authorString = "\(authorString) , \(author)";
            }
        }
        } else {
            authorString = authorArray[0].string!;
        }
        return authorString;
    }
    
    static func buildBooks(_ json: JSON) -> [Book] {
        var books = [Book]();
        for bookJson in json.array! {
            if let book = buildBook(bookJson) {
                books.append(book);
            }
        }
        return books;
    }
}
