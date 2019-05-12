//
//  ViewController.m
//  BillSplitter
//
//  Created by Frank Chen on 2019-05-12.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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
    double billAmount = [self.textField.text doubleValue];
    NSUInteger numOfPeopleToSplit = self.slider.value;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyPluralStyle];
    double billForEachPerson = billAmount / numOfPeopleToSplit;
    NSString* billString = [formatter stringFromNumber:[NSNumber numberWithFloat:billForEachPerson]];
    self.label.text = billString;
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    int discreteValue = roundl([sender value]);
    [sender setValue:(float)discreteValue];
}

@end
