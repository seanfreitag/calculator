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
    self.display.text = [self.display.text stringByAppendingString:digit];
}

- (NSString *)sizeHistoryToFit:(NSString *)suggestedHistory {
    CGSize historyTextSize = [suggestedHistory sizeWithFont:self.history.font];
    CGSize availableHistorySize = self.history.frame.size;
    if (historyTextSize.width > availableHistorySize.width) {
        NSArray *separatedString = [suggestedHistory componentsSeparatedByString:@"="];
        NSUInteger splitCount = [separatedString count];
        NSArray *shortenedHistory = [separatedString subarrayWithRange:NSMakeRange(1, splitCount - 1)];
        return [self sizeHistoryToFit:[shortenedHistory componentsJoinedByString:@"="]];
    }
    
    return suggestedHistory;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if ([self.display.text length] > 0)
        [self enterPressed];
    NSNumber *result = [self.brain performOperation:sender.currentTitle];
    NSString *history = [NSString stringWithFormat:@"%@ %@ = %@", self.history.text, sender.currentTitle, result];
    self.history.text = [self sizeHistoryToFit:history];
}

- (IBAction)enterPressed {
    [self.brain pushOperand:self.display.text];
    self.history.text = [NSString stringWithFormat:@"%@ %@", self.history.text, self.display.text];
    self.display.text = @"";
}

- (IBAction)clearPressed:(UIButton *)sender {
    self.history.text = @"";
    self.display.text = @"";
    [self.brain emptyStack];
}

- (IBAction)backspacePressed:(UIButton *)sender {
}

@end
