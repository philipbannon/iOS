//
//  ItemEntity+CoreDataProperties.h
//  ToDoListWithCoreData
//
//  Created by Philip Bannon on 07/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ItemEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;

@end

NS_ASSUME_NONNULL_END
