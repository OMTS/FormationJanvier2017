//
//  Router.swift
//  RestoFinder
//
//  Created by Iman Zarrabian on 16/01/2017.
//  Copyright © 2017 Iman Zarrabian. All rights reserved.
//

import Foundation
import Alamofire

enum RouterError: Error {
    case MiscError
}

enum Router: URLRequestConvertible {
    static let baseURLString = "https://restosformation-6e2c0.firebaseio.com"

    case getRestos
    case getRestoDetail(String)

    var method: HTTPMethod {
        switch self {
        case .getRestos:
            return .get
        case .getRestoDetail:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getRestos:
            return "/restos.json"
        case .getRestoDetail(let uniqueId):
            return "/restos/\(uniqueId).json"
        }
    }

    func asURLRequest() throws -> URLRequest {
        do {
            let url = try Router.baseURLString.asURL()

            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            return urlRequest

        } catch {
            throw RouterError.MiscError
        }
    }
}
