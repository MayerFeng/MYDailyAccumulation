//
//  InsetLabel.h
//  NeiQuanProject
//
//  Created by Mayer on 16/12/25.
//  Copyright © 2016年 内圈科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsetLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets contentInset;
- (CGSize)contentSize;   //label刚好需要的size

@end
