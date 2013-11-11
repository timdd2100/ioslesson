//
//  demoViewController.m
//  Demoviewcontroller
//
//  Created by timkao on 13/11/11.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "demoViewController.h"



@interface demoViewController ()

@end

@implementation demoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //set 成  seque的目標uiviewcontroller
    id page2 = segue.destinationViewController;
    
    //傳給page2的string變數
    [page2 setValue:self.textfield1.text forKey:@"string"];
    
    //
    [page2 setValue:self forKey:@"delegate"];
    
}
-(void)passValue:(NSString *)value{
    //
    self.textfield1.text = value;
}

//收鍵盤

-(IBAction)doEditFielddone:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)onbackgroundHit:(id)sender{
    [self.textfield1 resignFirstResponder];
}

@end
