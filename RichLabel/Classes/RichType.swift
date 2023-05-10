//
//  RichType.swift
//  Pods-RichLabel_Example
//
//  Created by fengming on 2023/5/10.
//

import Foundation

enum RichElement {
    case mention(String)
    case hashtag(String)
    case email(String)
    case url(original: String, trimmed: String)
    case custom(String)
    
    static func create(with RichType: RichType, text: String) -> RichElement {
        switch RichType {
        case .mention: return mention(text)
        case .hashtag: return hashtag(text)
        case .email: return email(text)
        case .url: return url(original: text, trimmed: text)
        case .custom: return custom(text)
        }
    }
}


public enum RichType {
    case mention
    case hashtag
    case url
    case email
    case custom(pattern: String)
    
    var pattern: String {
        switch self {
        case .mention: return RegexParser.mentionPattern
        case .hashtag: return RegexParser.hashtagPattern
        case .url: return RegexParser.urlPattern
        case .email: return RegexParser.emailPattern
        case .custom(let regex): return regex
        }
    }
}

extension RichType: Hashable, Equatable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .mention: hasher.combine(-1)
        case .hashtag: hasher.combine(-2)
        case .url: hasher.combine(-3)
        case .email: hasher.combine(-4)
        case .custom(let regex): hasher.combine(regex)
        }
    }
}

public func ==(lhs: RichType, rhs: RichType) -> Bool {
    switch (lhs, rhs) {
    case (.mention, .mention): return true
    case (.hashtag, .hashtag): return true
    case (.url, .url): return true
    case (.email, .email): return true
    case (.custom(let pattern1), .custom(let pattern2)): return pattern1 == pattern2
    default: return false
    }
}
