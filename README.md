NDEmailTextField
======================
![CocoaPods](https://cocoapod-badges.herokuapp.com/v/NDEmailTextField/badge.png)

1. Autocomplete email text field for iOS.
1. Subclass of `UITextField`.
1. **SUPER EASY** to use.
1. Customizable.

Screenshots
----

![Basic demo animated GIF](https://raw.githubusercontent.com/mozzet/NDEmailTextField/master/screenshot/demo.gif)

[We](https://github.com/mozzet) are also [using](https://itunes.apple.com/app/id427242564) `NDEmailTextField`!

![Noondate demo](https://raw.githubusercontent.com/mozzet/NDEmailTextField/master/screenshot/noondate_example.gif)

Installation
-----

Use [Cocoapods](http://cocoapods.org)
```ruby
pod 'NDEmailTextField'
```

Usage
-----

* Import `NDEmailTextField`.

  ```objc
  #import <NDEmailTextField/NDEmailTextField.h>
  ```

* Just initialize `NDEmailTextField` and add to your view.

  ```objc
  NDEmailTextField *textField = [[NDEmailTextField alloc] init];
  [self.view addSubview:textField];
  ```

* Set the domain list _(optional)_

  ```objc
  textField.domains = @[@"mozzet.com", @"yourdomain.com"];
  ```

* Set the domain text color _(optional)_

  ```objc
  textField.domainTextColor = [UIColor yourOwnColor];
  ```

To do
-----

* [ ] Interface builder support.
* [ ] Attributed domain text.

Author
-------

**NDEmailTextField** is written by [Taejun Kim (KimDarren)](https://github.com/KimDarren) [@mozzet](https://github.com/mozzet).

License
-------

**NDEmailTextField** is under MIT license. See the [LICENSE](LICENSE) for more info.