/*
 * Copyright (C) 2024 by Claudio Cambra <claudio.cambra@nextcloud.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
 * for more details.
 */

import Foundation

enum CodeSigningError: Error {
    case failedToCodeSign(String)
}

func codesign(
    identity: String,
    path: String,
    options: String = "--timestamp --force --preserve-metadata=entitlements --verbose=4 --options runtime"
) throws {
    print("Code-signing \(path)...")
    let command = "codesign -s \"\(identity)\" \(options) \(path)"
    guard shell(command) == 0 else {
        throw CodeSigningError.failedToCodeSign("Failed to code-sign \(path).")
    }
}
