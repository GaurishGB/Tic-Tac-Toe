//
//  ViewController.m
//  Tic Tac Toe
//
//  Created by Student-006 on 23/03/16.
//  Copyright © 2016 felixit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //If currentSymbol == 1 then set cross image on button, If currentSymbol == 2 then set nought image on button.
    
    currentSymbol = 1;
    
    count = 0;
    
    currentState = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    
    winingCombinations = @[@[@0,@1,@2],
                           @[@3,@4,@5],
                           @[@6,@7,@8],
                           @[@0,@3,@6],
                           @[@1,@4,@7],
                           @[@2,@5,@8],
                           @[@0,@4,@8],
                           @[@2,@4,@6],];
    
    isGameFinished = false;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttontapped:(UIButton *)sender
{
    if ([[currentState objectAtIndex:sender.tag] isEqual:@0])
    {
        count = count + 1;
        
        if (currentSymbol == 1) // 1 = cross.png
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"cross.png"] forState:UIControlStateNormal];
            
            [currentState replaceObjectAtIndex:sender.tag withObject:@1];
            
            currentSymbol = 2;
        }
        else  // 2 = nought.png
        {
            [sender setBackgroundImage:[UIImage imageNamed:@"nought.png"] forState:UIControlStateNormal];
            [currentState replaceObjectAtIndex:sender.tag withObject:@2];
            currentSymbol = 1;
        }
    }
    
    // Atleast we have to tap button 5 times to decide winner
    // So count >= 5
    if (count >= 5)
    {
        for (NSArray * combination in winingCombinations)
        {
            int firstIndex = [[combination objectAtIndex:0]intValue];
            int secondIndex = [[combination objectAtIndex:1]intValue];
            int thirdIndex = [[combination objectAtIndex:2]intValue];
            
            
            NSNumber * firstObject = [currentState objectAtIndex:firstIndex];
            NSNumber * secondObject = [currentState objectAtIndex:secondIndex];
            NSNumber * thirdObject = [currentState objectAtIndex:thirdIndex];
            
            
            if (![firstObject isEqualToNumber:@0] && [firstObject isEqual:secondObject] && [secondObject isEqual:thirdObject])
            {
             
                isGameFinished = true;
                
                NSString * title;
                
                if (currentSymbol == 1)
                {
                    title = @"Nought has won";
                }
                else
                {
                    title = @"Cross has won";
                    
                }
                [self presentAlertWithTitle:title];
                
                break;
            }
            
        }
        
    }
    
    if (isGameFinished == false && ![currentState containsObject:@0])
    {
        [self presentAlertWithTitle:@"Game is Drawn"];
    }
    
    
}

- (IBAction)crossTapped:(id)sender
{
    currentSymbol = 1;// Cross.png
    //Hiding Stack1
    self.stack1.hidden = YES;
}

- (IBAction)noughtTapped:(id)sender
{
    currentSymbol = 2;// Nought.png
    //Hiding stack1
    self.stack1.hidden = YES;}


-(void)presentAlertWithTitle:(NSString *)title;
{
    //Alert pop up
    UIAlertController * alertController =
    [UIAlertController alertControllerWithTitle:title message:@"Do you want to play again?" preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    //Button on Alert,& action to perform
    UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action)
                               {
                                   //                    for (UIButton * view in self.view.subviews)
                                   //                    {
                                   //                        if ([view isKindOfClass:[UIButton class]])
                                   //                        {
                                   //                            [view setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
                                   //                        }
                                   //                    }
                                   
                                   count = 0;
                                   currentState = [[NSMutableArray alloc]initWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
                                   
                                   isGameFinished = false;
                                   
                                   self.stack1.hidden = NO;
                                   
                                   for (int i = 0; i < 9; i++)
                                   {
                                       UIButton * button = [self.view viewWithTag:i];
                                       
                                       
                                       [button setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
                                   }
                               }];
    
    UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action)
                               {
                                   exit(0);
                               }];
    
    //Adding Button to Alert     Its mandatory.
    //if we not wrote this line. Alert("Unused variable action1,action2")
    [alertController addAction:action1];
    [alertController addAction:action2];
    
    
    
    
}
@end
