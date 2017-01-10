//
//  CVModules.h
//  WDReceiptOCR
//
//  Created by Evin Yang on 8/19/16.
//  Copyright © 2016 Workday. All rights reserved.
//

#ifndef CVModules_h
#define CVModules_h

#ifdef __cplusplus
extern "C" {
#endif
void findDocumentCorners(CGImageRef imageRef, CGFloat rows, CGFloat cols, CGPoint *nw, CGPoint *ne, CGPoint *se, CGPoint *sw, bool *rectForced);
CGImageRef rectifyRotateBinarizeResize(CGImageRef imageRef, CGFloat rows, CGFloat cols, CGPoint nw, CGPoint ne, CGPoint se, CGPoint sw, float desiredTextHeight);
#ifdef __cplusplus
}
#endif

#endif /* CVModules_h */
