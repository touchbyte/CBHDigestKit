//  CBHDigesterSHA256Tests.m
//  CBHDigestKitTests
//
//  Created by Christian Huxtable, April 2019.
//  Copyright (c) 2019, Christian Huxtable <chris@huxtable.ca>
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

@import XCTest;
@import CBHDigestKit;

#import "_DigestTests.h"


@interface CBHDigesterSHA256Tests : XCTestCase
@end


@implementation CBHDigesterSHA256Tests

- (void)testString
{
	NSString *message = @"The quick brown fox jumps over the lazy dog";

	NSData *digest = [CBHDigester digestString:message usingEncoding:NSUTF8StringEncoding andAlgorithm:CBHDigestAlgorithm_SHA256];
	NSString *expected = @"d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592";

	CBHAssertDigest(digest, expected);
}

- (void)testData
{
	NSData *message = [@"The quick brown fox jumps over the lazy dog" dataUsingEncoding:NSUTF8StringEncoding];

	NSData *digest = [CBHDigester digestData:message usingAlgorithm:CBHDigestAlgorithm_SHA256];
	NSString *expected = @"d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592";

	CBHAssertDigest(digest, expected);
}

- (void)testStream
{
	NSData *message = [@"The quick brown fox jumps over the lazy dog" dataUsingEncoding:NSUTF8StringEncoding];
	NSInputStream *stream = [NSInputStream inputStreamWithData:message];

	NSData *digest = [CBHDigester digestStream:stream usingAlgorithm:CBHDigestAlgorithm_SHA256];
	NSString *expected = @"d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592";

	CBHAssertDigest(digest, expected);
}

- (void)testEmpty
{
	NSString *message = @"";

	NSData *digest = [CBHDigester digestString:message usingEncoding:NSUTF8StringEncoding andAlgorithm:CBHDigestAlgorithm_SHA256];
	NSString *expected = @"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855";

	CBHAssertDigest(digest, expected);
}

@end
