//
//  Parser.h
//  xmltest
//
//  Created by timkao on 13/11/5.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject<NSXMLParserDelegate>
{
    NSXMLParser *parser;
    NSMutableString *element;
}

@end
