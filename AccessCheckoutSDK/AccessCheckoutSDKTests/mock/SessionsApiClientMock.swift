@testable import AccessCheckoutSDK

class SessionsApiClientMock: SessionsApiClient {
    var createSessionCalled: Bool = false
    var sessionToReturn: String?
    var error: AccessCheckoutError?
    
    init(sessionToReturn: String?) {
        self.sessionToReturn = sessionToReturn
        super.init()
    }
    
    init(error: AccessCheckoutError?) {
        self.error = error
        super.init()
    }
    
    public override func createSession(baseUrl: String, merchantId: String, cvc: String, completionHandler: @escaping (Result<String, AccessCheckoutError>) -> Void) {
        createSessionCalled = true
        
        if let sessionToReturn = self.sessionToReturn {
            completionHandler(.success(sessionToReturn))
        } else if let error = self.error {
            completionHandler(.failure(error))
        }
    }
}
