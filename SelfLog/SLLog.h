//
//  SLLog.h
//  SelfLog
//
//  Created by SatoDaisuke on 12/9/14.
//  Copyright (c) 2014 SatoDaisuke. All rights reserved.
//

#import "RLMObject.h"

@interface SLLog : RLMObject
@property NSString *title;
@property NSString *log;
@property NSDate *postedDate;
@end
