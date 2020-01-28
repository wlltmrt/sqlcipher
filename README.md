# SQLCipher

[![Build Status](https://travis-ci.org/wellmart/sqlcipher.svg?branch=master)](https://travis-ci.org/wellmart/sqlcipher)
[![Swift 5](https://img.shields.io/badge/swift-5-blue.svg)](https://developer.apple.com/swift/)
![Version](https://img.shields.io/badge/version-0.1.0-blue)
[![Software License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Swift Package Manager Compatible](https://img.shields.io/badge/swift%20package%20manager-compatible-blue.svg)](https://github.com/apple/swift-package-manager)

A framework provides transparent 256-bit AES full database encryption,  additional information and documentation is available on the official [SQLCipher](https://www.zetetic.net/sqlcipher/) site.
Special thanks for Zetetic.

## Requirements

Swift 5 and beyond.

## Usage

```swift
import SQLCipher

func main() {
    var db: COpaquePointer = nil
    
    let key = "key"
    let sql = "CREATE TABLE test(id INTEGER, field1 TEXT, field2 TEXT)"

    sqlite3_open_v2("db.sqlite3", &db, SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE, nil)
    sqlite3_key(db, key, Int32(key.utf8.count))

    if sqlite3_exec(db, sql, nil, nil, nil) != SQLITE_OK {
        print("Error on execute")
    }
}
```

To encrypt a database programmatically you can use the `sqlite3_key` function. 
The data provided in `pKey` is converted to an encryption key according to the 
same rules as `PRAGMA key`. 

```swift
int sqlite3_key(sqlite3 *db, const void *pKey, int nKey)
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
