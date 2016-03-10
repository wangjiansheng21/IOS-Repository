//
//  AddView.h
//  qq
//
//  Created by AppleUser on 16/3/10.
//  Copyright © 2016年 AppleUser. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddViewDelegate<NSObject>
@optional
-(void)toAnother:(NSInteger)index;
@end
@interface AddView : UIView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *dataLists;
@property(nonatomic,weak)id<AddViewDelegate>delegate;
@end
