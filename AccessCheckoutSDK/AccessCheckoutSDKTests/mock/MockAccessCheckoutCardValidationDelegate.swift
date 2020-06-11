import Cuckoo
@testable import AccessCheckoutSDK


public class MockAccessCheckoutCardValidationDelegate: AccessCheckoutCardValidationDelegate, Cuckoo.ProtocolMock {
    
    public typealias MocksType = AccessCheckoutCardValidationDelegate
    
    public typealias Stubbing = __StubbingProxy_AccessCheckoutCardValidationDelegate
    public typealias Verification = __VerificationProxy_AccessCheckoutCardValidationDelegate

    public let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: AccessCheckoutCardValidationDelegate?

    public func enableDefaultImplementation(_ stub: AccessCheckoutCardValidationDelegate) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
    public func cardBrandChanged(cardBrand: CardBrandClient?)  {
        
    return cuckoo_manager.call("cardBrandChanged(cardBrand: CardBrandClient?)",
            parameters: (cardBrand),
            escapingParameters: (cardBrand),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.cardBrandChanged(cardBrand: cardBrand))
        
    }
    
    
    
    public func panValidChanged(isValid: Bool)  {
        
    return cuckoo_manager.call("panValidChanged(isValid: Bool)",
            parameters: (isValid),
            escapingParameters: (isValid),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.panValidChanged(isValid: isValid))
        
    }
    
    
    
    public func expiryDateValidChanged(isValid: Bool)  {
        
    return cuckoo_manager.call("expiryDateValidChanged(isValid: Bool)",
            parameters: (isValid),
            escapingParameters: (isValid),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.expiryDateValidChanged(isValid: isValid))
        
    }
    
    
    
    public func cvvValidChanged(isValid: Bool)  {
        
    return cuckoo_manager.call("cvvValidChanged(isValid: Bool)",
            parameters: (isValid),
            escapingParameters: (isValid),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.cvvValidChanged(isValid: isValid))
        
    }
    
    
    
    public func validationSuccess()  {
        
    return cuckoo_manager.call("validationSuccess()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.validationSuccess())
        
    }
    

	public struct __StubbingProxy_AccessCheckoutCardValidationDelegate: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	    public init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func cardBrandChanged<M1: Cuckoo.OptionalMatchable>(cardBrand: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(CardBrandClient?)> where M1.OptionalMatchedType == CardBrandClient {
	        let matchers: [Cuckoo.ParameterMatcher<(CardBrandClient?)>] = [wrap(matchable: cardBrand) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockAccessCheckoutCardValidationDelegate.self, method: "cardBrandChanged(cardBrand: CardBrandClient?)", parameterMatchers: matchers))
	    }
	    
	    func panValidChanged<M1: Cuckoo.Matchable>(isValid: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: isValid) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockAccessCheckoutCardValidationDelegate.self, method: "panValidChanged(isValid: Bool)", parameterMatchers: matchers))
	    }
	    
	    func expiryDateValidChanged<M1: Cuckoo.Matchable>(isValid: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: isValid) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockAccessCheckoutCardValidationDelegate.self, method: "expiryDateValidChanged(isValid: Bool)", parameterMatchers: matchers))
	    }
	    
	    func cvvValidChanged<M1: Cuckoo.Matchable>(isValid: M1) -> Cuckoo.ProtocolStubNoReturnFunction<(Bool)> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: isValid) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockAccessCheckoutCardValidationDelegate.self, method: "cvvValidChanged(isValid: Bool)", parameterMatchers: matchers))
	    }
	    
	    func validationSuccess() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockAccessCheckoutCardValidationDelegate.self, method: "validationSuccess()", parameterMatchers: matchers))
	    }
	    
	}

	public struct __VerificationProxy_AccessCheckoutCardValidationDelegate: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	    public init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func cardBrandChanged<M1: Cuckoo.OptionalMatchable>(cardBrand: M1) -> Cuckoo.__DoNotUse<(CardBrandClient?), Void> where M1.OptionalMatchedType == CardBrandClient {
	        let matchers: [Cuckoo.ParameterMatcher<(CardBrandClient?)>] = [wrap(matchable: cardBrand) { $0 }]
	        return cuckoo_manager.verify("cardBrandChanged(cardBrand: CardBrandClient?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func panValidChanged<M1: Cuckoo.Matchable>(isValid: M1) -> Cuckoo.__DoNotUse<(Bool), Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: isValid) { $0 }]
	        return cuckoo_manager.verify("panValidChanged(isValid: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func expiryDateValidChanged<M1: Cuckoo.Matchable>(isValid: M1) -> Cuckoo.__DoNotUse<(Bool), Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: isValid) { $0 }]
	        return cuckoo_manager.verify("expiryDateValidChanged(isValid: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func cvvValidChanged<M1: Cuckoo.Matchable>(isValid: M1) -> Cuckoo.__DoNotUse<(Bool), Void> where M1.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool)>] = [wrap(matchable: isValid) { $0 }]
	        return cuckoo_manager.verify("cvvValidChanged(isValid: Bool)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func validationSuccess() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("validationSuccess()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

public class AccessCheckoutCardValidationDelegateStub: AccessCheckoutCardValidationDelegate {
    

    

    
    public func cardBrandChanged(cardBrand: CardBrandClient?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public func panValidChanged(isValid: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public func expiryDateValidChanged(isValid: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public func cvvValidChanged(isValid: Bool)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
    public func validationSuccess()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

