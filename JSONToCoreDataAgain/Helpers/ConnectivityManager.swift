//
//  ConnectivityManager.swift
//  JSONToCoreDataAgain
//
//  Copyright © 2019 anoop. All rights reserved.
//

import Foundation
import Alamofire

public enum NetworkConnectionStatus: String {
    case online
    case offline
}

public protocol NetworkConnectionStatusListener: class {
    func networkStatusDidChange(status: NetworkConnectionStatus)
}
class ConnectivityMananger: NSObject {
    
    private override init() {
        super.init()
        configureReachability()
    }
    private static let _shared = ConnectivityMananger()
    
    class func shared() -> ConnectivityMananger {
        
        return _shared
    }
    
    private let networkReachability: NetworkReachabilityManager? = NetworkReachabilityManager()
    
    var isNetworkAvailable: Bool {
        return networkReachability?.isReachable ?? false
    }
    
    var listeners = [NetworkConnectionStatusListener]()
    
    private func configureReachability() {
        networkReachability?.listener = {[weak self] status in
            switch status {
            case .unknown:
                self?.notifyAllListenersWith(status: .offline)
            case .notReachable:
                self?.notifyAllListenersWith(status: .offline)
            case .reachable(.ethernetOrWiFi): fallthrough
            case .reachable(.wwan):
                self?.notifyAllListenersWith(status: .online)
            }
        }
    }
    private func notifyAllListenersWith(status: NetworkConnectionStatus) {
        print("Network Connection status is \(status.rawValue)")
        for listener in listeners {
            listener.networkStatusDidChange(status: status )
        }
    }
    
    func addListener(listener: NetworkConnectionStatusListener) {
        listeners.append(listener)
    }
    
    func removeListener(listener: NetworkConnectionStatusListener) {
        listeners = listeners.filter { $0 !== listener}
    }
    func startListening() {
        networkReachability?.startListening()
    }
    func stopListening() {
        networkReachability?.stopListening()
    }
}
