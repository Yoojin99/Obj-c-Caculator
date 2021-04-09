//
//  ViewController.m
//  CalculatorProj
//
//  Created by NHN on 2021/04/05.
//

#import "ViewController.h"
#import "ButtonCollectionViewCell.h"
#import "Stack.h"
#import "Calculator.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property UILabel* printLabel;
@property NSMutableString* printText;
@property UICollectionView* numberPanel;
@property NSArray<NSString*>* buttonTexts;
@property Stack* numberStack;
@property Stack* operationStack;
@property Calculator* calculator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _calculator = [Calculator new];
    
    _printLabel = [[UILabel alloc] initWithFrame: CGRectZero];
    _printLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightBold];
    _printLabel.textColor = UIColor.blackColor;
    _printLabel.layer.borderWidth = 2;
    _printLabel.layer.borderColor = UIColor.blackColor.CGColor;
    _printLabel.text = @"0";
    _printLabel.textAlignment = NSTextAlignmentRight;
    
    UICollectionViewFlowLayout *sLayout = [[UICollectionViewFlowLayout alloc] init]; // layout 정렬.custom으로 만들 수 있음
        sLayout.sectionInset                = UIEdgeInsetsZero;
        sLayout.minimumInteritemSpacing     = 0.0f;
        sLayout.minimumLineSpacing          = 0.0f;
        sLayout.headerReferenceSize         = CGSizeZero;
        sLayout.footerReferenceSize         = CGSizeZero;
//    sLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize;
    
    _numberPanel = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:sLayout];
    _numberPanel.backgroundColor = UIColor.whiteColor;
    [_numberPanel registerClass:ButtonCollectionViewCell.class forCellWithReuseIdentifier:NSStringFromClass(ButtonCollectionViewCell.class)];
    _numberPanel.dataSource = self;
    _numberPanel.delegate =self;
    
    [self.view addSubview:_printLabel];
    [self.view addSubview:_numberPanel];
    
    _printLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _numberPanel.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [NSLayoutConstraint activateConstraints:@[
        [_printLabel.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100],
        [_printLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [_printLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:30],
        
        [_numberPanel.topAnchor constraintEqualToAnchor:_printLabel.bottomAnchor constant:100],
        [_numberPanel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:30],
        [_numberPanel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-30],
        [_numberPanel.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30],

    ]];
    
    
    _buttonTexts = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"+", @"-", @"x", @"/", @"Enter", @"Del", @"C"];
}

//1
- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    UICollectionViewFlowLayout *sLayout = (UICollectionViewFlowLayout*) self.numberPanel.collectionViewLayout;
//    sLayout.itemSize = CGSizeMake((self.numberPanel.frame.size.width)/3, (self.numberPanel.frame.size.width)/3); // cell 하나의 크기
//    [sLayout invalidateLayout];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ButtonCollectionViewCell* sCell = (ButtonCollectionViewCell*) [collectionView dequeueReusableCellWithReuseIdentifier: NSStringFromClass(ButtonCollectionViewCell.class) forIndexPath:indexPath];
    
    sCell.buttonTextLabel.text = [_buttonTexts objectAtIndex:indexPath.row];
    
    sCell.layer.borderColor =UIColor.blackColor.CGColor;
    sCell.layer.borderWidth = 2;
    
    
    return sCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _buttonTexts.count;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   ButtonCollectionViewCell* cell =  [collectionView cellForItemAtIndexPath:indexPath];
    
    //NSLog(@"%@", cell.buttonTextLabel.text);
    [self buttonPush:cell.buttonTextLabel.text];
}

//3
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
        return CGSizeMake((collectionView.frame.size.width)/3, (collectionView.frame.size.width)/3); // cell 하나의 크기

}

//구조 변경 필요!!
-(void) buttonPush: (NSString*) text {
    if ([text  isEqualToString: @"="]) {
        [self calculate];
        
    } else if ([text  isEqualToString: @"Del"]) {
        [self pushDelete];
    } else if ([text  isEqualToString: @"C"]) {
        [self pushC];
    } else if ([text isEqualToString:@"Enter"]){
        [self calculate];
    } else if ([self isNumberText:text]) {
        [self pushNumber:text];
    }  else {
        [self pushOperation:text];
    }
}

-(BOOL) isNumberText : (NSString*) text{
    int num = [text intValue];
    if (num >= 0 && num <= 9)
        return true;
    return false;
}

-(void) calculate {
    _numberStack = [Stack new];
    _operationStack = [Stack new];
    NSString* text = _printLabel.text;
    NSString* tmpNumber = @"";
    double result = 0;
    
    for (int i=0; i<text.length; i++) {
        char tc = [text characterAtIndex:i];
        NSString* c = [NSString stringWithFormat:@"%c", tc];
        if ([c intValue] >= 1 && [c intValue] <= 9) {
            tmpNumber = [tmpNumber stringByAppendingString:c];
        } else {
            int tmpNumberValue = [tmpNumber intValue];
            [_numberStack push:[[NSNumber alloc] initWithInt:tmpNumberValue]];
            [_operationStack push:c];
            tmpNumber = @"";
        }
    }
    int tmpNumberValue = [tmpNumber intValue];
    [_numberStack push:[[NSNumber alloc] initWithInt:tmpNumberValue]];

    for (NSNumber* n in [_numberStack stack]){
            NSLog(@"numstack : %i", n.intValue);
        }
    
        for (NSString* n in [_operationStack stack]){
            NSLog(@"operStack : %@", n );
        }
        
    int num1 = [[[_numberStack stack] objectAtIndex:0] intValue];
    int num2 = [[[_numberStack stack] objectAtIndex:1] intValue];
    
    NSString* operator = [[_operationStack stack] objectAtIndex:0];
    
    if ([operator isEqual:@"+"]){
        result = [_calculator add:num1 with:num2];
    } else if ([operator isEqual:@"-"]) {
        result = [_calculator subtract:num1 with:num2];

    } else if ([operator isEqual:@"x"]) {
        result = [_calculator multiply:num1 with:num2];

    } else if ([operator isEqual:@"/"]) {
        if (num2 == 0) {
            _printLabel.text = @"divide by zero";
            return;
        }
        result = [_calculator divide:num1 with:num2];

    }
    
    _printLabel.text = [NSString stringWithFormat:@"%lf", result];

}
    //후위표기법 전환 , 계산 필요
//    for (int i=0; i<text.length; i++) {
//        char tc = [text characterAtIndex:i];
//        NSString* c = [NSString stringWithFormat:@"%c", tc];
//
//        NSLog(@"c : %@", c);
//        if ([c intValue] >= 1 && [c intValue] < 9){
//            tmpNumber = [tmpNumber stringByAppendingString:c];
//        } else if ([c isEqual:@"+"] || [c isEqual:@"-"]) {
//            int tmpNumberValue = [tmpNumber intValue];
//            [_numberStack push:[[NSNumber alloc] initWithInt:tmpNumberValue]];
//            [_operationStack push:c];
//            tmpNumber = @"";
//        } else {
//            int beforeNum = [[_numberStack pop] intValue];
//            int afterNum = [tmpNumber intValue];
//
//            if ([c isEqual:@"x"]){
//                [_numberStack push: [[NSNumber alloc] initWithInt: [_calculator multiply:beforeNum with:afterNum]]];
//            } else {
//                if (afterNum == 0) {
//                    _printLabel.text = @"Divide by zero";
//                } else {
//                    [_numberStack push: [[NSNumber alloc] initWithInt: [_calculator divide:beforeNum with:afterNum]]];
//                }
//            }
//        }
//    }
//
//    int tmpNumberValue = [tmpNumber intValue];
//    [_numberStack push:[[NSNumber alloc] initWithInt:tmpNumberValue]];
//
//
//
//
//    for (NSNumber* n in [_numberStack stack]){
//        NSLog(@"numstack : %i", n.intValue);
//    }
//
//    for (NSString* n in [_operationStack stack]){
//        NSLog(@"operStack : %@", n );
//    }


-(void) pushDelete {
    if ([_printLabel.text isEqual:@"0"])
        return;
    
    if (_printLabel.text.length == 1) {
        [self initPrintText];
        return;
    }
    
    _printLabel.text = [_printLabel.text substringToIndex:[_printLabel.text length] - 1];

}

-(void) pushNumber : (NSString*) text {
    if ([_printLabel.text isEqual:@"0"]) {
        _printLabel.text = text;
        return;
    }
    
    _printLabel.text = [_printLabel.text stringByAppendingString:text];
}

-(void) pushC {
    [self initPrintText];
}

-(void) initPrintText {
    _printLabel.text = @"0";
}

-(void) pushOperation : (NSString*) text
{
    char c = [_printLabel.text characterAtIndex:(_printLabel.text.length - 1)];
    NSString* str = [NSString stringWithFormat:@"%c", c];
    
    if (![self isNumberText:str]) {
        return;
    }
    _printLabel.text = [_printLabel.text stringByAppendingString:text];
}



@end
