import PromiseKit

class SessionsApiDiscovery {
    private var discoveryFactory: SingleLinkDiscoveryFactory
    
    init() {
        self.discoveryFactory = SingleLinkDiscoveryFactory()
    }
    
    init(discoveryFactory: SingleLinkDiscoveryFactory) {
        self.discoveryFactory = discoveryFactory
    }
    
    func discover(baseUrl: String) -> Promise<String> {
        return firstly {
            discoveryFactory.create(toFindLink: ApiLinks.sessions.service, usingRequest: requestToFindService(baseUrl)).discover()
        }.then { serviceUrl in
            self.discoveryFactory.create(toFindLink: ApiLinks.sessions.endpoint, usingRequest: self.requestToFindEndPoint(serviceUrl)).discover()
        }.then { endPointUrl -> Promise<String> in
            .value(endPointUrl)
        }
    }
    
    private func requestToFindService(_ baseUrl: String) -> URLRequest{
        return URLRequest(url: URL(string: baseUrl)!)
    }
    
    private func requestToFindEndPoint(_ serviceUrl: String) -> URLRequest{
        var request = URLRequest(url: URL(string: serviceUrl)!)
        request.addValue(ApiHeaders.sessionsHeaderValue, forHTTPHeaderField: "content-type")
        request.addValue(ApiHeaders.sessionsHeaderValue, forHTTPHeaderField: "accept")
        
        return request
    }
}
