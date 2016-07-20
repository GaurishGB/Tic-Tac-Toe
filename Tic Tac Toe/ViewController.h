//
//  ViewController.h
//  Tic Tac Toe
//
//  Created by Student-006 on 23/03/16.
//  Copyright © 2016 felixit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    int currentSymbol;
    
    NSMutableArray * currentState;
    NSArray * winingCombinations;
    int count;
    BOOL isGameFinished;
    
}

- (IBAction)buttontapped:(UIButton *)sender;
- (IBAction)crossTapped:(id)sender;
- (IBAction)noughtTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIStackView *stack1;



@end

