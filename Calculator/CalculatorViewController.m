//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Sheena Deutsch on 7/10/13.
//  Copyright (c) 2013 Sheena Deutsch. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"


@interface CalculatorViewController ()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@property (weak, nonatomic) IBOutlet UILabel *history;
@property (weak, nonatomic) IBOutlet UILabel *display;

@end

@implementation CalculatorViewController

- (CalculatorBrain *)brain {
    if (!_brain)
        _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = sender.currentTitle;
    if (self.userIsInTheMiddleOfEnteringANumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    self.history.text = self.history.text = [self.history.text stringByAppendingString:digit];
}

- (IBAction)operationPressed:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber)
        [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.history.text = [self.history.text stringByAppendingString:@" "];
    self.history.text = [self.history.text stringByAppendingString:self.display.text];
}

- (IBAction)clearPressed:(UIButton *)sender {
}

- (IBAction)backspacePressed:(UIButton *)sender {
}

@end
