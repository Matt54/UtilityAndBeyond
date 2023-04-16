//
//  Encodable+Extensions.swift
//  
//
//  Created by Matt Pfeiffer on 4/16/23.
//

import Foundation

public extension Encodable {
    func data(using encoder: JSONEncoder = .iso8601) throws -> Data {
        try encoder.encode(self)
    }
    func dataPrettyPrinted() throws -> Data {
        try JSONEncoder.iso8601PrettyPrinted.encode(self)
    }
    // edit if you need the data using a custom date formatter
    func dataDateFormatted(with dateFormatter: DateFormatter) throws -> Data {
        JSONEncoder.shared.dateEncodingStrategy = .formatted(dateFormatter)
        return try JSONEncoder.shared.encode(self)
    }
    func json() throws -> String {
         String(data: try data(), encoding: .utf8) ?? ""
    }
    func jsonPrettyPrinted() throws -> String {
        String(data: try dataPrettyPrinted(), encoding: .utf8) ?? ""
    }
    func jsonDateFormatted(with dateFormatter: DateFormatter) throws -> String {
        return String(data: try dataDateFormatted(with: dateFormatter), encoding: .utf8) ?? ""
    }
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
          throw NSError()
        }
        return dictionary
    }
}
