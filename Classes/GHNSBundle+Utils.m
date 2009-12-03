//
//  GHNSBundle+Utils.m
//  GHKit
//
//  Created by Gabriel Handford on 4/27/09.
//  Copyright 2009. All rights reserved.
//

#import "GHNSBundle+Utils.h"

@implementation NSBundle (GHUtils)

- (NSData *)gh_loadDataFromResource:(NSString *)resource {
	NSParameterAssert(resource);
	NSString *resourcePath = [self pathForResource:[resource stringByDeletingPathExtension] ofType:[resource pathExtension]];	
	if (!resourcePath) [NSException raise:NSInvalidArgumentException format:@"Resource not found: %@", resource];	
	NSError *error = nil;
	NSData *data = [NSData dataWithContentsOfFile:resourcePath options:0 error:&error];
	if (error) [NSException raise:NSInvalidArgumentException format:@"Error loading resource at path (%@): %@", resourcePath, error];
	return data;
}

- (NSString *)gh_loadStringDataFromResource:(NSString *)resource {
	return [[[NSString alloc] initWithData:[self gh_loadDataFromResource:resource] encoding:NSUTF8StringEncoding] autorelease];
}

- (NSURL *)gh_URLForResource:(NSString *)resource {
  NSParameterAssert(resource);
	NSString *resourcePath = [self pathForResource:[resource stringByDeletingPathExtension] ofType:[resource pathExtension]];	
  return [NSURL fileURLWithPath:resourcePath];
}

@end
