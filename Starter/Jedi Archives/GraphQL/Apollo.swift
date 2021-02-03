

// swiftlint:disable:next superfluous_disable_command
// swiftlint:disable force_unwrapping
import Foundation
import Apollo

class Apollo {
    static let shared = Apollo()
    
    let client: ApolloClient
    
    init() {
        client = ApolloClient(url: URL(string: "http://localhost:50610")!)
    }
}
