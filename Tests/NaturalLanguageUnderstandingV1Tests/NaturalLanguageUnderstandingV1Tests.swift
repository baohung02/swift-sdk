/**
 * Copyright IBM Corporation 2017
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import XCTest
import Foundation
import NaturalLanguageUnderstandingV1

class NaturalLanguageUnderstandingV1Tests: XCTestCase {
    
    private var naturalLanguageUnderstanding: NaturalLanguageUnderstanding!
    private let timeout: TimeInterval = 5.0
    
    override func setUp() {
        super.setUp()
        instantiateNaturalLanguageUnderstanding()
    }
    
    static var allTests : [(String, (NaturalLanguageUnderstandingV1Tests) -> () throws -> Void)] {
        return [
        ]
    }
    
    /** Instantiate Natural Language Understanding instance. */
    func instantiateNaturalLanguageUnderstanding() {
        let username = Credentials.NaturalLanguageUnderstandingUsername
        let password = Credentials.NaturalLanguageUnderstandingPassword
        naturalLanguageUnderstanding = NaturalLanguageUnderstanding(username: username, password: password, version: "2016-05-17")
    }
    
    /** Fail false negatives. */
    func failWithError(error: Error) {
        XCTFail("Positive test failed with error: \(error)")
    }
    
    /** Fail false positives. */
    func failWithResult<T>(result: T) {
        XCTFail("Negative test returned a result.")
    }
    
    /** Wait for expectations. */
    func waitForExpectations() {
        waitForExpectations(timeout: timeout) { error in
            XCTAssertNil(error, "Timeout")
        }
    }
    
    // MARK: - Helper Functions
    
    /** Load a file. */
    func loadFile(name: String, withExtension: String) -> URL? {
        
        #if os(iOS)
            let bundle = Bundle(for: type(of: self))
            guard let url:URL = bundle.url(forResource: name, withExtension: withExtension) else {
                return nil
            }
        #else
            let url = URL(fileURLWithPath: "Tests/NaturalLanguageUnderstandingV1Tests/"+name+"."+withExtension)
        #endif
        
        return url
    }
    
    /// load text to analyze
    
    /// load html to analyze
    
    /// load public webpage to analyze.
    
    // MARK: - Positive tests
    
    /** Analyze given test text with . */
    func testAnalyzeText() {
        let description = "Analyze text with features."
    }
    
    func testAnalyzeTextWithCategories() {
        let description = "analyze text with categories"
        let expectation = self.expectation(description: description)
        
        let text = "In 2009, Elliot Turner launched AlchemyAPI to process the written word, with all of its quirks and nuances, and got immediate traction."
        
        let features = Features()
        
        let param = Parameters(features: features, text: text)
        naturalLanguageUnderstanding.analyzeContent(withParameters: param, failure: failWithError) {
            results in
            
            print(results)
            expectation.fulfill()
        }
        waitForExpectations()
    }

    // MARK: - Negative tests
    
}
