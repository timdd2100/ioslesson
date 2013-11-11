//
//  demo2ViewController.h
//  Demoviewcontroller
//
//  Created by timkao on 13/11/11.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>

//
@protocol Page2Delegate

//method
-(void)passValue:(NSString *)value;


@end

@interface demo2ViewController : UIViewController



@property (nonatomic,strong) IBOutlet UIButton *button;

@property (nonatomic,strong) IBOutlet UITextField *textfield2;

@property (strong) NSString *string;


//宣告一個採用協定的物件
@property(weak) id<Page2Delegate> delegate;


-(IBAction)returnToFirstPage:(id)sender;

@end
