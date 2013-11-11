//
//  demo2ViewController.m
//  Demoviewcontroller
//
//  Created by timkao on 13/11/11.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "demo2ViewController.h"

@interface demo2ViewController ()

@end

@implementation demo2ViewController

//屬性起用
@synthesize string,delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.textfield2.text = string;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)returnToFirstPage:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    //呼叫協定中的方法並帶入page2textfield的數值
    [delegate passValue:self.textfield2.text];
}

//收鍵盤

-(IBAction)doEditFielddone2:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)onbackgroundHit2:(id)sender{
    [self.textfield2 resignFirstResponder];
}


@end
