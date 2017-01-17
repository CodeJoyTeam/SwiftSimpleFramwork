import UIKit

// MARK: -
// MARK: DeviceType Extends UIDevice
// MARK: -
extension UIDevice {
    // MARK: -> Class methods
    // 判断 是否 iphone4
    public class func isIPhone4() -> Bool {
        return UIScreen.main.currentMode?.size == CGSize(width:640, height:960)
    }
    // 判断 是否 iphone5
    public class func isIPhone5() -> Bool {
        return UIScreen.main.currentMode?.size == CGSize(width:640, height:1136)
    }
    // 判断 是否 iphone6
    public class func isIPhone6() -> Bool {
        return UIScreen.main.currentMode?.size == CGSize(width:750, height:1334)
    }
    // 判断 是否 iphone6 plus
    public class func isIPhone6Plus() -> Bool {
        return UIScreen.main.currentMode?.size == CGSize(width:1242, height:2208)
    }
    // 判断 是否 iphone6 plus bigMode
    public class func isIPhone6PlusBigMode() -> Bool {
        return UIScreen.main.currentMode?.size == CGSize(width:1125, height:2001)
    }
    
    /// 获取ip地址
    func getWiFiAddress() -> String? {
        var address : String?
        
        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }
        
        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee
            
            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                
                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if  name == "en0" {
                    
                    // Convert interface address to a human readable string:
                    var addr = interface.ifa_addr.pointee
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(&addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)
        
        return address
    }
    
}

