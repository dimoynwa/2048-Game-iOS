
#import "ViewController.h"
#import "DataHandler.h"
#import "CellColor.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UICollectionView *collection;
@property DataHandler* data;
@property id<SwipeProtocol> delegate;
@property CellColor* cellColor;

@property UISwipeGestureRecognizer* recognizerRight;
@property UISwipeGestureRecognizer* recognizerLeft;
@property UISwipeGestureRecognizer* recognizerUp;
@property UISwipeGestureRecognizer* recognizerDown;

@end

static const NSUInteger kNumberOfViews =16;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.data =  [DataHandler sharedInstance];
    self.delegate = [DataHandler sharedInstance];
    self.cellColor = [CellColor sharedInstance];
    
    //RIGHT SWIPE
    self.recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(respondToSwipe:)];
    [self.recognizerRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
    self.recognizerRight.delegate=self;
    [[self view] addGestureRecognizer:self.recognizerRight];
    
    //LEFT SWIPE
    self.recognizerLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(respondToSwipe:)];
    [self.recognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    self.recognizerLeft.delegate=self;
    [[self view] addGestureRecognizer:self.recognizerLeft];
    
    //UP SWIPE
    self.recognizerUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(respondToSwipe:)];
    [self.recognizerUp setDirection:UISwipeGestureRecognizerDirectionUp];
    self.recognizerUp.delegate = self;
    [[self view] addGestureRecognizer:self.recognizerUp];
   
    //DOWN SWIPE
    self.recognizerDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(respondToSwipe:)];
    [self.recognizerDown setDirection:UISwipeGestureRecognizerDirectionDown];
    self.recognizerDown.delegate=self;
    [[self view] addGestureRecognizer:self.recognizerDown];
    

    
}

-(CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat width = (rect.size.width - 25)/4;
    return CGSizeMake(width, width);
}

-(void) respondToSwipe : (UISwipeGestureRecognizer*) swipe {
    if(swipe.direction == UISwipeGestureRecognizerDirectionDown)
        [self.delegate swipeDown];
    if(swipe.direction == UISwipeGestureRecognizerDirectionUp)
        [self.delegate swipeUp];
    if(swipe.direction == UISwipeGestureRecognizerDirectionRight)
        [self.delegate swipeRight];
    if(swipe.direction == UISwipeGestureRecognizerDirectionLeft)
        [self.delegate swipeLeft];
    bool can = [self.data generateNumber];
    if([self.data.maxNum isEqualToNumber:@2048]) {
        UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You reach 2048" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        [av show];
    } else if(!can) {
        UIAlertView* av = [[UIAlertView alloc] initWithTitle:@"You lose!" message:@"You lose!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        [av show];
    }
    
    [self.collection reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return kNumberOfViews;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    
    UICollectionViewCell* cell = [self.collection dequeueReusableCellWithReuseIdentifier:@"view" forIndexPath:indexPath];
    
    UILabel *label = (UILabel*)[cell viewWithTag:1];
    
    if(![self.data.board[indexPath.row] isEqualToNumber:@0])
        label.text = [NSString stringWithFormat:@"%@" ,[self.data.board objectAtIndex:indexPath.row]];
    else
        label.text = @"";
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGFloat width = (rect.size.width - 25)/4;
    
    cell.layer.cornerRadius = width/8;
    
    //    NSMutableString* infoInCell = [self.data.board objectAtIndex:indexPath.row];
    //    if(![infoInCell isEqualToString:@""]){
    //        NSInteger valueInCell = infoInCell.integerValue;
    //
    cell.backgroundColor = [self.cellColor getColorforCellAtIndex:indexPath.row withValue:self.data.board[indexPath.row]];
    //    }
    return cell;
    
  }


@end
