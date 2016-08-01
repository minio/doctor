# Customization
There are 2 levels of customization possible in Doctor. One can edit project details from within the dashboard and change project 
name, project links in the header and the footer. See screenshot below :

## Brand Customizations
![Brand](https://github.com/deekoder/doctest/blob/master/brand.png?raw=true "Brand Dashboard")

The second level of customization can be done on variables.scss file. You may change fonts, colors, backgrounds, text colors, borders
sidebar to your needs. In the next version of Doctor some of these tuning will also be available through the dashboard.

## Code Customizations
For doing this, please fork the repository at https://github.com/minio/doctor and edit the variable.scss fiel
```css
$body-bg: #fafafa;

/*--------------------
  Font
--------------------*/
$font-family: 'Lato', sans-serif;
$font-family-glyph: fontAwesome;
$font-family-headings: 'Lato', sans-serif;
$font-family-mono: 'Roboto Mono', monospace;
$font-size: 17px;
$line-height: 1.5;
$line-height-heading: 1.1;


/*--------------------
  Text Colors
--------------------*/
$heading-color: #5c6267;
$link-color: #4FA2E4;
$text-color: #7c8287;
$text-muted: #9a9a9a;
$text-strong: #4e4e4e;


$headings-font-weight: 400;


/*--------------------
  Border Colors
--------------------*/
$line-color: #efefef;
$input-border: #f4f4f4;


/*--------------------
  Sidebar
--------------------*/
$sidebar-bg: #f1f1f1;


/*--------------------
  Colors
--------------------*/
$blue: #2196F3;
$light-blue: #03A9F4;
$red: #F44336;
$cyan: #00BCD4;
$teal: #009688;
$green: #4CAF50;
$light-green: #8BC34A;
$orange: #FF9800;
$amber: #FFC107;
$grey: #9E9E9E;
$blue-gray: #607D8B;
$dark: #252b2f;

```
