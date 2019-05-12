//
//  ViewController.m
//  BillSplitter
//
//  Created by Frank Chen on 2019-05-12.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self calculateTip:[self.textField.text doubleValue]];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
        int discreteValue = roundl([sender value]);
    [sender setValue:(float)discreteValue];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString* newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    double billAmount = [newString floatValue];
    [self calculateTip:billAmount];
    return YES;
}

-(void)calculateTip:(float)billAmount{
    NSUInteger numOfPeopleToSplit = self.slider.value;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyPluralStyle];
    double billForEachPerson = billAmount / numOfPeopleToSplit;
    NSString* billString = [formatter stringFromNumber:[NSNumber numberWithFloat:billForEachPerson]];
    self.label.text = billString;
}

@end
