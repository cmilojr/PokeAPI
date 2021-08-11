//
//  Networking.swift
//  iBuy
//
//  Created by Camilo Jimenez on 4/08/21.
//

import Foundation
import Alamofire

public class Networking {
    static let shared = Networking()
    private init(){}
    
    func getList<T: Decodable>(_ url: URL, completion: @escaping ([T]?, Error?)-> Void) {
        AF
            .request(url)
            .validate()
            .responseDecodable(of: [T].self) { response in
                if let err = response.error {
                    completion(nil, err)
                } else if let result = response.value {
                    completion(result, nil)
                }
            }
    }
    
    func getItems(_ url: URL, completion: @escaping (itemsResponse?, Error?)-> Void) {
        AF
            .request(url)
            .validate()
            .responseDecodable(of: itemsResponse.self) { response in
                if let err = response.error {
                    completion(nil, err)
                } else if let result = response.value {
                    completion(result, nil)
                }
            }
    }
}


