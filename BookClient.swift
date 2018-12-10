//
//  BookClient.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 25/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import Foundation
import SwiftyJSON;
import PromiseKit;
class BookClinet {
    let API_BASE_URL = "http://openlibrary.org/";
    var delegate: BookClientDelegate!;
    
    init(_ delegate: BookClientDelegate) {
        self.delegate = delegate;
    }
    
    func getBooks(query: String) {
        if let urlString = "search.json?q=\(query)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            let url = URL(string: "\(API_BASE_URL)\(urlString)");
            if let url = url {
                firstly {
                    URLSession.shared.dataTask(.promise, with: url)
                    }.map { data in
                        let json = try! JSON(data: data.data);
                         BooksList.books = BookParser.buildBooks(json["docs"]);
                    }.done {
                         //print($0.data);
                        self.delegate.onSuccess();
                    }.catch { error in 
                        self.delegate.onError(error: error);
                }
            }
        }
    }
    
    func makeUrlRequest(_ url: URL) throws -> URLRequest{
        var rq = URLRequest(url: url)
        rq.httpMethod = "GET"
        return rq
        
    }
    
    func parseAnswer(_ data: Data) -> [String: Any]? {
        do {
            //            if let jsonArray = try JSONSerialization.jsonObject(with: data!, options : .allowFragments) as? [Dictionary<String,Any>]
            if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
            {
                return json;
            } else {
                print("bad json")
                return nil;
            }
        } catch let error as NSError {
            print(error)
            return nil;
        }
        return nil;
    }
}
extension Array {
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:Element] {
        var dict = [Key:Element]()
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}
