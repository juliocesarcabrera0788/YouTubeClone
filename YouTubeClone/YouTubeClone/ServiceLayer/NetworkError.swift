//
//  NetworkError.swift
//  YouTubeClone
//
//  Created by Julio Cabrera on 2024-02-21.
//

import Foundation
enum NetworkError: String, Error{
    case invalidURL
    case serializationFalid
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "ocurrio un error al tratar de consultar el API: status code"
    case jsonDecoder = "Error al intentar extraer datos de json."
    case unauthorized
}
