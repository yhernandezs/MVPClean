//
//  Interactor.swift
//  TinderCatCore
//
//  Created by Yesid Hernandez on 12/12/19.
//  Copyright © 2019 Yesid Hernandez. All rights reserved.
//

import Foundation
import RxSwift

protocol Interactor {
    associatedtype Response
    associatedtype Params

    func execute(params: Params, onSuccess: @escaping (Response) -> Void, onError: @escaping (Error) -> Void) -> Disposable
}

open class ObservableInteractor<R, P>: Interactor {

    public typealias Response = R
    public typealias Params = P
    
    open func execute(params: Params, onSuccess: @escaping (Response) -> Void = { _ in}, onError: @escaping (Error) -> Void) -> Disposable {
        return buildUseCase(params: params)
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: onSuccess, onError: onError)
    }

    open func buildUseCase(params: Params) -> Observable<Response> {
        return Observable.create({ _ in
            return Disposables.create()
        })
    }
}

open class CompletableInteractor<P>: Interactor {

    public typealias Response = Any?
    public typealias Params = P

    open func execute(params: P, onSuccess: @escaping (_: Any?) -> Void = { _ in}, onError: @escaping (Error) -> Void) -> Disposable {
        return buildUseCase(params: params)
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onCompleted: {
                onSuccess(nil)
            }, onError: onError)
    }

    open func buildUseCase(params: Params) -> Completable {
        return Completable.create { event in
            event(CompletableEvent.completed)
            return Disposables.create()
        }
    }
}

