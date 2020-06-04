import Cuckoo
@testable import AccessCheckoutSDK


 class MockPanValidationStateHandler: PanValidationStateHandler, Cuckoo.ProtocolMock {
    
     typealias MocksType = PanValidationStateHandler
    
     typealias Stubbing = __StubbingProxy_PanValidationStateHandler
     typealias Verification = __VerificationProxy_PanValidationStateHandler

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: PanValidationStateHandler?

     func enableDefaultImplementation(_ stub: PanValidationStateHandler) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func handlePanValidation(isValid: Bool, cardBrand: CardBrand2?)  {
        
    return cuckoo_manager.call("handlePanValidation(isValid: Bool, cardBrand: CardBrand2?)",
            parameters: (isValid, cardBrand),
            escapingParameters: (isValid, cardBrand),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.handlePanValidation(isValid: isValid, cardBrand: cardBrand))
        
    }
    
    
    
     func isCardBrandDifferentFrom(cardBrand: CardBrand2?) -> Bool {
        
    return cuckoo_manager.call("isCardBrandDifferentFrom(cardBrand: CardBrand2?) -> Bool",
            parameters: (cardBrand),
            escapingParameters: (cardBrand),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.isCardBrandDifferentFrom(cardBrand: cardBrand))
        
    }
    

	 struct __StubbingProxy_PanValidationStateHandler: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func handlePanValidation<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(isValid: M1, cardBrand: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Bool, CardBrand2?)> where M1.MatchedType == Bool, M2.OptionalMatchedType == CardBrand2 {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool, CardBrand2?)>] = [wrap(matchable: isValid) { $0.0 }, wrap(matchable: cardBrand) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPanValidationStateHandler.self, method: "handlePanValidation(isValid: Bool, cardBrand: CardBrand2?)", parameterMatchers: matchers))
	    }
	    
	    func isCardBrandDifferentFrom<M1: Cuckoo.OptionalMatchable>(cardBrand: M1) -> Cuckoo.ProtocolStubFunction<(CardBrand2?), Bool> where M1.OptionalMatchedType == CardBrand2 {
	        let matchers: [Cuckoo.ParameterMatcher<(CardBrand2?)>] = [wrap(matchable: cardBrand) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockPanValidationStateHandler.self, method: "isCardBrandDifferentFrom(cardBrand: CardBrand2?) -> Bool", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_PanValidationStateHandler: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func handlePanValidation<M1: Cuckoo.Matchable, M2: Cuckoo.OptionalMatchable>(isValid: M1, cardBrand: M2) -> Cuckoo.__DoNotUse<(Bool, CardBrand2?), Void> where M1.MatchedType == Bool, M2.OptionalMatchedType == CardBrand2 {
	        let matchers: [Cuckoo.ParameterMatcher<(Bool, CardBrand2?)>] = [wrap(matchable: isValid) { $0.0 }, wrap(matchable: cardBrand) { $0.1 }]
	        return cuckoo_manager.verify("handlePanValidation(isValid: Bool, cardBrand: CardBrand2?)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func isCardBrandDifferentFrom<M1: Cuckoo.OptionalMatchable>(cardBrand: M1) -> Cuckoo.__DoNotUse<(CardBrand2?), Bool> where M1.OptionalMatchedType == CardBrand2 {
	        let matchers: [Cuckoo.ParameterMatcher<(CardBrand2?)>] = [wrap(matchable: cardBrand) { $0 }]
	        return cuckoo_manager.verify("isCardBrandDifferentFrom(cardBrand: CardBrand2?) -> Bool", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class PanValidationStateHandlerStub: PanValidationStateHandler {
    

    

    
     func handlePanValidation(isValid: Bool, cardBrand: CardBrand2?)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func isCardBrandDifferentFrom(cardBrand: CardBrand2?) -> Bool  {
        return DefaultValueRegistry.defaultValue(for: (Bool).self)
    }
    
}

