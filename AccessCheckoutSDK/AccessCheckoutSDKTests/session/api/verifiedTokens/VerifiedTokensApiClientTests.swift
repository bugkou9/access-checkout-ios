@testable import AccessCheckoutSDK
import Mockingjay 
import XCTest

class VerifiedTokensApiClientTests: XCTestCase {
    private let baseUrl = "http://localhost"
    private let pan = "a-pan"
    private let expiryMonth: UInt = 12
    private let expiryYear: UInt = 24
    private let cvc = "123"
    
    private let mockDiscovery = VerifiedTokensApiDiscoveryMock()
    private let mockURLRequestFactory = VerifiedTokensSessionURLRequestFactoryMock()
    
    private let expectedSession = "a-session"
    private let expectedDiscoveredUrl = "http://and-end-point"
    
    private let urlRequestFactoryResult = URLRequest(url: URL(string: "a-url")!)
    private var expectationToFulfill: XCTestExpectation?
    
    override func setUp() {
        mockURLRequestFactory.willReturn(urlRequestFactoryResult)
        expectationToFulfill = expectation(description: "")
    }
    
    func testDiscoversApiAndCreatesSession() {
        mockDiscovery.willComplete(with: expectedDiscoveredUrl)
        let mockRestClient = RestClientMock(replyWith: successResponse(withSession: expectedSession))
        
        let client = VerifiedTokensApiClient(discovery: mockDiscovery, urlRequestFactory: mockURLRequestFactory, restClient: mockRestClient)
        
        client.createSession(baseUrl: baseUrl, merchantId: "", pan: pan, expiryMonth: expiryMonth, expiryYear: expiryYear, cvc: cvc) { result in
            switch result {
            case .success(let session):
                XCTAssertEqual(self.expectedSession, session)
                XCTAssertEqual(self.urlRequestFactoryResult, mockRestClient.requestSent)
                XCTAssertEqual(self.pan, self.mockURLRequestFactory.panPassed)
                XCTAssertEqual(self.expiryMonth, self.mockURLRequestFactory.expiryMonthPassed)
                XCTAssertEqual(self.expiryYear, self.mockURLRequestFactory.expiryYearPassed)
                XCTAssertEqual(self.cvc, self.mockURLRequestFactory.cvcPassed)
                XCTAssertEqual(self.expectedDiscoveredUrl, self.mockURLRequestFactory.urlPassed)
            case .failure:
                XCTFail("Creation of session shoul have succeeded")
            }
            self.expectationToFulfill!.fulfill()
        }
        
        wait(for: [expectationToFulfill!], timeout: 1)
    }
    
    func testReturnsDiscoveryErrorWhenApiDiscoveryFails() {
        let expectedError = AccessCheckoutClientError.unknown(message: "an-error")
        mockDiscovery.willComplete(with: expectedError)
        let mockRestClient = RestClientMock(replyWith: successResponse(withSession: expectedSession))
        
        let client = VerifiedTokensApiClient(discovery: mockDiscovery, urlRequestFactory: mockURLRequestFactory, restClient: mockRestClient)
        
        client.createSession(baseUrl: baseUrl, merchantId: "", pan: pan, expiryMonth: expiryMonth, expiryYear: expiryYear, cvc: cvc) { result in
            switch result {
            case .success:
                XCTFail("Creation of session should have failed")
            case .failure(let error):
                XCTAssertEqual(expectedError, error)
            }
            self.expectationToFulfill!.fulfill()
        }
        
        wait(for: [expectationToFulfill!], timeout: 1)
    }
    
    func testReturnsSessionNotFound_whenExpectedSessionIsNotInResponse() {
        mockDiscovery.willComplete(with: expectedDiscoveredUrl)
        let mockRestClient = RestClientMock(replyWith: responseWithoutExpectedLink())
        
        let client = VerifiedTokensApiClient(discovery: mockDiscovery, urlRequestFactory: mockURLRequestFactory, restClient: mockRestClient)
        
        client.createSession(baseUrl: baseUrl, merchantId: "", pan: pan, expiryMonth: expiryMonth, expiryYear: expiryYear, cvc: cvc) { result in
            switch result {
            case .success:
                XCTFail("Creation of session should have failed")
            case .failure(let error):
                XCTAssertEqual(AccessCheckoutClientError.sessionNotFound(message: "Failed to find link \(ApiLinks.sessions.result) in response"), error)
            }
            self.expectationToFulfill!.fulfill()
        }
        
        wait(for: [expectationToFulfill!], timeout: 1)
    }
    
    func testReturnsServiceError_whenServiceErrorsOut() {
        mockDiscovery.willComplete(with: expectedDiscoveredUrl)
        let expectedError = AccessCheckoutClientError.unknown(message: "some-error")
        let mockRestClient = RestClientMock<String>(errorWith: expectedError)
        
        let client = VerifiedTokensApiClient(discovery: mockDiscovery, urlRequestFactory: mockURLRequestFactory, restClient: mockRestClient)
        
        client.createSession(baseUrl: baseUrl, merchantId: "", pan: pan, expiryMonth: expiryMonth, expiryYear: expiryYear, cvc: cvc) { result in
            switch result {
            case .success:
                XCTFail("Creation of session should have failed")
            case .failure(let error):
                XCTAssertEqual(expectedError, error)
            }
            self.expectationToFulfill!.fulfill()
        }
        
        wait(for: [expectationToFulfill!], timeout: 1)
    }
    
    private func successResponse(withSession: String) -> ApiResponse {
        let responseAsString =
            """
                {
                    "_links": {
                        "verifiedTokens:session": {
                            "href": "\(withSession)"
                        }
                    }
                }
            """
        
        let responseAsData = responseAsString.data(using: .utf8)!
        return try! JSONDecoder().decode(ApiResponse.self, from: responseAsData)
    }
    
    private func responseWithoutExpectedLink() -> ApiResponse {
        let responseAsString =
            """
                {
                    "_links": {
                        "otherservice:session": {
                            "href": "http://somewhere"
                        }
                    }
                }
            """
        
        let responseAsData = responseAsString.data(using: .utf8)!
        return try! JSONDecoder().decode(ApiResponse.self, from: responseAsData)
    }
}
