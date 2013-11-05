//
//  Parser.m
//  xmltest
//
//  Created by timkao on 13/11/5.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "Parser.h"


@implementation Parser


-(id) init
{
    if(self ==[super init]){
        parser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"xml"]]];
        [parser setDelegate:self];
        [parser parse];
    }
    return self;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSLog(@"started element %@",elementName);
    element = [NSMutableString string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"found an element named: %@ with a value of: %@",elementName,element);
}

-(void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (element == nil) {
        element = [[NSMutableString alloc]init];
        
    }
    [element appendString:string];
}

@end
