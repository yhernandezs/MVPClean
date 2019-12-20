//
//  BaseAPIClient.swift
//  TinderCatData
//
//  Created by Yesid Hernandez on 12/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import RxSwift
import Vatosawa
import Alamofire
public class BaseAPIClient: ClientProtocol {

    public var manager: SessionManager!

    public init(timeOut: Int = 60) {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        configuration.timeoutIntervalForRequest = TimeInterval(timeOut)
        self.manager = SessionManager(configuration: configuration)
    }

    open func request<Response>(_ endpoint: Endpoint<Response>) -> Observable<Response> {
        return Observable<Response>.create({ emitter in

            guard let url = self.url(path: endpoint.relativePath) else {
                print("malformedURL")
                return Disposables.create()
            }

            let request = self.manager.request(
                url,
                method: endpoint.method,
                parameters: endpoint.parameters,
                encoding: endpoint.parameterEncoding,
                headers: HTTPHeaders())

            request.validate()
                .debugLog()
                .responseData(queue: DispatchQueue.global(), completionHandler: { response in
                        let result = response.result.flatMap(endpoint.decode)

                        switch result {

                        case let .success(val):
                            emitter.onNext(val)
                            emitter.onCompleted()
                        case let .failure(err):
                            debugPrint(err.localizedDescription)
                            if let decodingError = err as? DecodingError {
                                debugPrint("************",
                                    "Decoding Error. Reason:",
                                    "\(decodingError)", "************",
                                    separator: ".\n")
                            }

                            debugPrint("Error Endpoint: \(request.request?.url?.absoluteString ?? "")")

                            if let resData = response.data {
                                if var resString = String(data: resData, encoding: .utf8) {
                                    resString.removeAll(where: { $0 == "\\" })
                                    debugPrint("** Error Response data: ** : \(resString)")
                                }
                            }

                            guard let error = err as? AFError else {
                                emitter.onError(err)
                                return
                            }

                            guard let responseCode = error.responseCode else {
                                emitter.onError(err)
                                return
                            }

                            if let errorMesage = self.getMessageError(dataReponse: response.data) {
                                emitter.onError(self.validateResponseCode(responseCode, currentError: err, description: errorMesage))
                            }

                            emitter.onError(self.validateResponseCode(responseCode, currentError: err))
                        }
                    })
                .responseJSON(completionHandler: { (json) in
                    debugPrint(json)

                })

            return Disposables.create() {
                request.cancel()
            }
        })
    }

    private func getMessageError(dataReponse: Data?) -> String? {
        var errorMessage: String? = nil

        guard let data = dataReponse else {
            return errorMessage
        }

        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let dictionary = json as? [String: Any],
                let errorArray = dictionary["error"] as? [String: Any],
                let message = errorArray["message"] as? String {
                errorMessage = message
                return errorMessage
            } else {
                return errorMessage
            }

        } catch {
            return errorMessage
        }
    }
    private func validateResponseCode(_ responseCode: Int, currentError: Error, description: String? = nil) -> Error {
        return currentError
    }
    private func url(path: String) -> URL? {
        let formattedURL = URL(string: "https://api.thecatapi.com/v1/")
        return formattedURL?.appendingPathComponent(path)
    }

}

extension Request {
    public func debugLog() -> Self {
        debugPrint(self)
        return self
    }
}
