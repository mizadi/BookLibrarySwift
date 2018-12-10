//
//  BookClientDelegate.swift
//  LibraryDemo
//
//  Created by Adi Mizrahi on 25/10/2018.
//  Copyright © 2018 Adi Mizrahi. All rights reserved.
//

import Foundation
import SwiftyJSON;
import UIKit;
protocol BookClientDelegate  {
    func onError(error: Error);
    func onSuccess( );
}
