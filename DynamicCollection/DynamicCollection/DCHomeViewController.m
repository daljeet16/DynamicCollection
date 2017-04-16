//
//  DCHomeViewController.m
//  DynamicCollection
//
//  Created by DaljeetSingh on 15/04/17.
//  Copyright © 2017 mli. All rights reserved.
//

#import "DCHomeViewController.h"
#import "DCHomeCollectionViewCell.h"
#import "MBProgressHUD.h"
@interface DCHomeViewController ()
@property (nonatomic,strong) NSMutableArray *dataDictionaryArray;
@property (weak,nonatomic) IBOutlet UICollectionView *collectionView;
@end
long lastSelectedRow;
@implementation DCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"HOME";
    lastSelectedRow = -1;
    [self getFlickrData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UICollectionView DataSource, Delegate methods

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataDictionaryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DCHomeCollectionViewCell *cell=[_collectionView dequeueReusableCellWithReuseIdentifier:@"collection_cell" forIndexPath:indexPath];
        NSDictionary *dict = _dataDictionaryArray[indexPath.row];
        DCFlickrModel *flickrModel1  = dict[@"0"];
        cell.leftButton.tag = indexPath.row;
        [cell.leftImageView sd_setImageWithURL:[NSURL URLWithString:flickrModel1.imageUrl]];
     DCFlickrModel * flickrModel2  = dict[@"1"];
       cell.rightButton.tag = indexPath.row;
       [cell.rightImageView sd_setImageWithURL:[NSURL URLWithString:flickrModel2.imageUrl]];
    [self setCellUI:cell model:flickrModel1 imageView:cell.leftImageView];
    [self setCellUI:cell model:flickrModel2 imageView:cell.rightImageView];
    [cell.leftButton addTarget:self action:@selector(leftImageSelected:) forControlEvents:UIControlEventTouchUpInside];
    [cell.rightButton addTarget:self action:@selector(rightImageSelected:) forControlEvents:UIControlEventTouchUpInside];
    return  cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = _dataDictionaryArray[indexPath.row];
    DCFlickrModel *flickrModel1  = dict[@"0"];
    DCFlickrModel *flickrModel2  = dict[@"1"];
    long height = 156.0 * SCALE;
    if(flickrModel1.selectedCheck == true || flickrModel2.selectedCheck == true){
        height = 289.0 * SCALE;
    }
   
    return CGSizeMake(320.0 * SCALE,height);

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.1;
}

-(void)setCellUI:(DCHomeCollectionViewCell *)cell model:(DCFlickrModel *)model imageView:(UIImageView *)imageView{

    if(model.selectedCheck == true){
        imageView.layer.borderWidth = 4.0;
        imageView.layer.borderColor = [UIColor colorWithRed:(0.0/255.0) green:(122.0/255.0) blue:(255.0/255.0) alpha:1.0].CGColor;
        cell.titleLabel.text = model.title;
        cell.itemIdLabel.text = model.item_id;
    }
    else{
         imageView.layer.borderWidth = 0.0;
    }
}

-(void)leftImageSelected:(UIButton *)button{

    if(lastSelectedRow != -1){
        NSDictionary *dict = _dataDictionaryArray[lastSelectedRow];
        DCFlickrModel *flickrModel  = dict[@"0"];
        flickrModel.selectedCheck = false;
        flickrModel  = dict[@"1"];
        flickrModel.selectedCheck = false;
    }
     NSDictionary *dict = _dataDictionaryArray[button.tag];
    DCFlickrModel *flickrModel  = dict[@"0"];
    flickrModel.selectedCheck = true;
    lastSelectedRow = button.tag;
    [_collectionView reloadData];


}

-(void)rightImageSelected:(UIButton *)button{
   
    if(lastSelectedRow != -1){
        NSDictionary *dict = _dataDictionaryArray[lastSelectedRow];
        DCFlickrModel *flickrModel  = dict[@"1"];
        flickrModel.selectedCheck = false;
        flickrModel  = dict[@"0"];
        flickrModel.selectedCheck = false;
    }
    NSDictionary *dict = _dataDictionaryArray[button.tag];
    DCFlickrModel *flickrModel  = dict[@"1"];
    flickrModel.selectedCheck = true;
    lastSelectedRow = button.tag;
    [_collectionView reloadData];
    
}


-(void)getFlickrData{
   [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   [DCDataLayer getFlickrData:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=48f9c14b43633c56c652c104473eb891&tags=dog&per_page=20&format=json&nojsoncallback=1" success:^(NSDictionary *responseObject) {
       NSLog(@"response:  %@",responseObject);
       if([responseObject isKindOfClass:[NSDictionary class]]){
           NSDictionary *responseData = responseObject[@"photos"];
           if([responseData[@"photo"] isKindOfClass:[NSArray class]]){
               NSArray *photoDataArray = responseData[@"photo"];
               [self parseFlickrData:photoDataArray];
           }
       }
   } failure:^(NSError *error) {
       [MBProgressHUD hideHUDForView:self.view animated:YES];
   }];
}

-(void)parseFlickrData:(NSArray *)photoDataArray{
    
    _dataDictionaryArray = [[NSMutableArray alloc] init];
    int i = 0;
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] init];
    for (int dataCount = 0; dataCount < photoDataArray.count; dataCount++) {
        
        DCFlickrModel *flickrModel = [[DCFlickrModel alloc] init];
        [flickrModel initWitDict:photoDataArray[dataCount]];
        flickrModel.selectedCheck = false;
        [mutableDictionary setObject:flickrModel
                              forKey:[NSString stringWithFormat:@"%d",i]];
        if(i == 1){
            [_dataDictionaryArray addObject:mutableDictionary];
            mutableDictionary = [[NSMutableDictionary alloc] init];
            i = 0;
        }
        else{
            i++;
        }
    }
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [_collectionView reloadData];
    NSLog(@"%@",mutableDictionary);
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
