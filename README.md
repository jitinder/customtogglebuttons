# Custom Toggle Buttons

A custom ToggleButtons implementation that allows more flexibility than Flutter's inbuilt ToggleButtons.

## Features
- Horizontal and Vertical Alignment support
- Elevation support
- More customization for each state (selected, disabled, unselected
- Similar look and feel as Flutter Material CustomButtons

## Getting started

Add this dependency to your package's pubspec.yaml file:
```
dependencies:
  ...
  customtogglebuttons: ^0.0.5
```
and install it by running the following in your command line:
```
flutter pub get
```

Now you can use this in your source file by adding the following import:

```dart
import 'package:customtogglebuttons/customtogglebuttons.dart';
```

## Usage

The simplest example is below, it creates a 2 icon set of toggle buttons that can be selected or unselected on each click.

Create a list of boolean values to store selected/unselected state:
```dart
List<bool> _isSelected = [false, false];
```

In your build method:

```dart
CustomToggleButtons(
	isSelected: _isSelected,
	children: <Widget>[
		Icon(Icons.add),
		Icon(Icons.remove),
	],
	onPressed: (index) {
		setState(() {
			_isSelected[index] = !_isSelected[index];
		});
	},
),
```

**NOTE:** The length of the bool List you pass in `isSelected` has to be the same as the length of the `children` list.


## Examples

The source code for all examples is available in the [example/lib/main.dart](https://github.com/jitinder/customtogglebuttons/blob/master/example/lib/main.dart "example/lib/main.dart") file.

You can run the [example](https://github.com/jitinder/customtogglebuttons/tree/master/example "example") app on your mobile device and have a look at each of the samples in action.

<img src="https://github.com/jitinder/customtogglebuttons/blob/master/screenshots/example.png?raw=true">

##### Default

Shows the default behaviour without any additional styling properties. When the width of the buttons is longer than the available width, the next buttons automatically wrap to the next line.

<img src="https://github.com/jitinder/customtogglebuttons/blob/master/screenshots/default.gif?raw=true">

##### Vertical Alignment

Shows vertically aligned toggle buttons, and a sample with Text widgets.

<img src ="https://github.com/jitinder/customtogglebuttons/blob/master/screenshots/vertical.gif?raw=true">

##### Border Styling

Shows an example of borderless toggle buttons, and an example where the border width and color are set for selected and unselected states.

<img src ="https://github.com/jitinder/customtogglebuttons/blob/master/screenshots/borderstyle.gif?raw=true">

##### Color Styling

Shows colors set for the selected, unselected and disabled states. Also shows an example with a specified splash color.

<img src="https://github.com/jitinder/customtogglebuttons/blob/master/screenshots/color%20styling.gif?raw=true">

##### Spacing and Elevation

Shows examples with spacing for horizontal and vertical alignment, and an example with elevation.

<img src ="https://github.com/jitinder/customtogglebuttons/blob/master/screenshots/spaceandelev.gif?raw=true">


## Additional Parameters

| Parameter | Type | Usage | Description | Required? |
| :------------ | :------------ | :------------ | :------------ | :------------ |
| children | `List<Widget>` | `children: <Widget>[...]` | The toggle button widgets. These are typically `Icon` or `Text` widgets. Length of list must be equal to the length of isSelected list. | Yes |
| isSelected | `List<bool>` | `isSelected: <bool>[...]` | The corresponding selection state of each toggle button. Length of list must be equal to the length of children list.| Yes |
| onPressed | `void Function(index)` | `onPressed: (){...}` | The callback that is called when a button is tapped. The index parameter of the callback is the index of the button that is tapped | No || onPressed | `void Function(index)` | `onPressed: (){...}` | The callback that is called when a button is tapped. The index parameter of the callback is the index of the button that is tapped. | No |
| constraints | `BoxConstraints` | `constraints: BoxConstraints(...)` | Defines the button's size. If this property is null, then BoxConstraints(minWidth: 48.0, minHeight: 48.0) is be used. | No |
| color | `Color` | `color: Colors.orange` | The color for descendant [Text] and [Icon] widgets if the button is enabled and not selected. Defaults to Theme.of(context).colorScheme.onSurface. | No |
| selectedColor | `Color` | `selectedColor: Colors.orange` | The color for descendant [Text] and [Icon] widgets if the button is selected. Defaults to Theme.of(context).colorScheme.primary. | No |
| disabledColor | `Color` | `disabledColor: Colors.orange` | The color for descendant [Text] and [Icon] widgets if the button is disabled. Defaults to Theme.of(context).colorScheme.onSurface.withOpacity(0.38). | No |
| fillColor | `Color` | `fillColor:: Colors.orange` | The fill color for selected toggle buttons. Defaults to Colors.transparent. | No |
| unselectedFillColor | `Color` | `unselectedFillColor: Colors.orange` | The fill color for unselected toggle buttons. Defaults to Colors.transparent. | No |
| disabledFillColor | `Color` | `disabledFillColor: Colors.orange` | The fill color for disabled toggle buttons. Defaults to Colors.transparent. | No |
| highlightColor | `Color` | `highlightColor: Colors.orange` | The highlight color for the button's `InkWell`. Defaults to Theme.of(context).highlightColor. | No |
| splashColor | `Color` | `splashColor: Colors.orange` | The splash color for the button's  `InkWell`. Defaults to Theme.of(context).splashColor. | No |
| hoverColor | `Color` | `hoverColor: Colors.orange` | The color to use for filling the button when the button has a pointer hovering over it. Defaults to Theme.of(context).hoverColor. | No |
| renderBorder | `bool` | `renderBorder: false` | Whether or not to render a border around each toggle button. If false, no border will be rendered, even if other border properties are defined. Defaults to true. | No |
| borderColor | `Color` | `borderColor: Colors.orange` | The border color to display when the toggle button is enabled and not selected. Defaults to Colors.black12. | No |
| selectedBorderColor | `Color` | `selectedBorderColor: Colors.orange` | The border color to display when the toggle button is selected. Defaults to Colors.black12.| No |
| disabledBorderColor | `Color` | `disabledBorderColor: Colors.orange` | The border color to display when the toggle button is disabled. Defaults to Colors.black12. | No |
| borderWidth | `double` | `borderWidth: 2.5` | The width of the border surrounding each toggle button. This applies to both the greater surrounding border, as well as the borders between buttons. Defaults to a width of 1.0 | No |
| borderRadius | `double` | `borderRadius: 2.5` | **Not implemented** The radii of the border's corners. Defaults to 0.0| No |
| spacing | `double` | `spacing: 5.0` | The space between two consecutive toggle buttons. Defaults to 0.0. | No |
| runSpacing | `double` | `runSpacing: 5.0` | The space between two consecutive runs of toggle buttons. Defaults to 0.0. | No |
| direction | `Axis` | `direction: Axis.vertical` | The direction in which the toggle buttons will be created. Can be either Axis.horizontal or Axis.vertical. Defaults to Axis.horizontal. | No |
| elevation | `double` | `elevation: 10.0` | The elevation of each toggle button. Defaults to 0.0. | No |

## Contributing

All contributions are welcome 😄

- If you found a bug/issue with the library, consider [making an Issue](https://github.com/jitinder/customtogglebuttons/issues/new "making an Issue") describing it in as much detail possible.
- If you want to fix something, add something you feel is relevant or resolve an issue, feel free to submit a [Pull Request](https://github.com/jitinder/customtogglebuttons/pulls "Pull Request"). Try to be as descriptive as possible about what the PR is about.
- Do consider modifying the documentation and adding documentation comments in your code so that the existing documentation is kept up-to-date.