//
//  ViewController.m
//  test
//
//  Created by Константин Васильев on 28.08.17.
//  Copyright © 2017 Константин Васильев. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
NSInteger number = UINT_MAX;
NSInteger currentNumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    _button.layer.cornerRadius = 5.0f;
    _button.layer.borderWidth = 1.0f;
    _button.layer.borderColor = [UIColor blackColor].CGColor;
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (IBAction)hideButtonClick:(id)sender
{
    if (_blackRectangleView.alpha > 0)
    {
    [UIView animateWithDuration:.3 animations:^{
        _blackRectangleView.alpha = 0.0f;
    } completion:^(BOOL finished) {}];
        
    [_button setTitle:@"Отобразить" forState:UIControlStateNormal];
    }
    else
    {
        [UIView animateWithDuration:.3 animations:^{
            _blackRectangleView.alpha = 1.0f;
        } completion:^(BOOL finished) {}];
        
        [_button setTitle:@"Скрыть" forState:UIControlStateNormal];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self performSelectorInBackground:@selector(getPrimeNumber) withObject:nil];
}

- (void)updateLabel
{
    dispatch_async(dispatch_get_main_queue(), ^{
    [_numberLabel setText:[NSString stringWithFormat:@"%lu",currentNumber]];
        });
}

- (void)getPrimeNumber
{
    NSInteger i;
    NSInteger j;
    NSInteger k;
    
    for(i=1;i<=number;i++)
    {
        j=0;
        k=0;
        
        while(++j<=i)
        {
            if(i%j==0)
            {
                k+=j;
            }
        }
        
        if(k-1==i)
        {
            currentNumber = i;
            
            [self updateLabel];
            [NSThread sleepForTimeInterval: 0.3];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
