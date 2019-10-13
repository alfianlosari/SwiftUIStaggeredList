# StaggeredList

A Staggered Pinterest Like Layout using SwiftUI

![Alt text](./promo.png?raw=true "A Staggered Pinterest Like Layout using SwiftUI")

## Installation
- Add the dependency to your target/project using Swift Package Manager
- Import framework in your source

## How to use
Initialize StaggeredLayoutList passing your collection that conforms to `Identifiable`. Vertical and Horitontal Spacing can be passed for adding padding between items. Also Section Insets can be passed to add inset to the List.
```
StaggeredLayoutList(data: self.notes, numberOfColumns: self.numberOfColumns, horizontalSpacing: self.spacing, verticalSpacing: self.spacing, sectionInsets: sectionInset) {
    NoteView(note: $0)
}
```

## Sample App (iOS, macOS, watchOS, tvOS)
https://github.com/alfianlosari/SwiftUIStaggeredNote

## Special Thanks
Inspired by objc.io Swift Talk Building Collection View talk at:
Building a Collection View (Part 2)
