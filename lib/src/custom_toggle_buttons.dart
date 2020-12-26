part of customtogglebuttons;

// TODO: Border (shape, style, radius), Text style, buttonbar shape (stadium)
// TODO: Add more Wrap customizations e.g. crossAxis, mainAxis etc.
// TODO: Unselected splash button

/// A custom implementation that expands on Flutter's [ToggleButtons]
///
/// The list of [children] are laid out as per the specified [direction].
/// The state of each button is controlled by [isSelected], which is a list
/// of bool that determine if a button is in an unselected or selected state.
///
/// The length of [isSelected] has to match the length of the [children] list as
/// they are both correlated by their index in either list.
class CustomToggleButtons extends StatelessWidget {
  CustomToggleButtons({
    Key key,
    @required this.children,
    @required this.isSelected,
    this.onPressed,
    this.constraints,
    this.color,
    this.selectedColor,
    this.disabledColor,
    this.fillColor,
    this.unselectedFillColor,
    this.disabledFillColor,
    this.highlightColor,
    this.splashColor,
    this.hoverColor,
    this.renderBorder = true,
    this.borderColor,
    this.selectedBorderColor,
    this.disabledBorderColor,
    this.borderWidth,
    this.borderRadius,
    this.spacing = 0,
    this.runSpacing = 0,
    this.direction = Axis.horizontal,
    this.elevation = 0,
  })  : assert(children != null),
        assert(isSelected != null),
        assert(children.length == isSelected.length),
        super(key: key);

  /// The toggle button widgets.
  ///
  /// These are typically [Icon] or [Text] widgets. The boolean selection
  /// state of each widget is defined by the corresponding [isSelected]
  /// list item.
  final List<Widget> children;

  /// The corresponding selection state of each toggle button.
  ///
  /// Each value in this list represents the selection state of the [children]
  /// widget at the same index.
  final List<bool> isSelected;

  /// The callback that is called when a button is tapped.
  ///
  /// The index parameter of the callback is the index of the button that is
  /// tapped or otherwise activated.
  ///
  /// When the callback is null, all toggle buttons will be disabled.
  final void Function(int index) onPressed;

  /// Defines the button's size.
  ///
  /// Typically used to constrain the button's minimum size.
  ///
  /// If this property is null, then
  /// BoxConstraints(minWidth: 48.0, minHeight: 48.0) is be used.
  final BoxConstraints constraints;

  /// The color for descendant [Text] and [Icon] widgets if the button is
  /// enabled and not selected.
  ///
  /// If [onPressed] is not null, this color will be used for values in
  /// [isSelected] that are false.
  ///
  /// If this property is null, then Theme.of(context).colorScheme.onSurface
  /// is used.
  final Color color;

  /// The color for descendant [Text] and [Icon] widgets if the button is
  /// selected.
  ///
  /// If [onPressed] is not null, this color will be used for values in
  /// [isSelected] that are true.
  ///
  /// If this property is null, then Theme.of(context).colorScheme.primary is
  /// used.
  final Color selectedColor;

  /// The color for descendant [Text] and [Icon] widgets if the button is
  /// disabled.
  ///
  /// If [onPressed] is null, this color will be used.
  ///
  /// If this property is null, then
  /// Theme.of(context).colorScheme.onSurface.withOpacity(0.38) is used.
  final Color disabledColor;

  /// The fill color for selected toggle buttons.
  ///
  /// If this property is null, then Colors.transparent is used.
  final Color fillColor;

  /// The fill color for unselected toggle buttons.
  ///
  /// If this property is null, then Colors.transparent is used.
  final Color unselectedFillColor;

  /// The fill color for disabled toggle buttons.
  ///
  /// If this property is null, then Colors.transparent is used.
  final Color disabledFillColor;

  /// The highlight color for the button's [InkWell].
  ///
  /// If this property is null, then Theme.of(context).highlightColor is used.
  final Color highlightColor;

  /// The splash color for the button's [InkWell].
  ///
  /// If this property is null, then Theme.of(context).splashColor is used.
  final Color splashColor;

  /// The color to use for filling the button when the button has a pointer
  /// hovering over it.
  ///
  /// If this property is null, then Theme.of(context).hoverColor is used.
  final Color hoverColor;

  /// Whether or not to render a border around each toggle button.
  ///
  /// When true, a border with [borderWidth], [borderColor] and [borderRadius]
  /// (borderRadius doesn't work yet) will render. Otherwise, the default border
  /// will be rendered.
  final bool renderBorder;

  /// The border color to display when the toggle button is enabled and not
  /// selected.
  ///
  /// If this property is null, then Colors.black12 is used.
  final Color borderColor;

  /// The border color to display when the toggle button is selected.
  ///
  /// If this property is null, then Colors.black12 is used
  final Color selectedBorderColor;

  /// The border color to display when the toggle button is disabled.
  ///
  /// If this property is null, then Colors.black12 is used
  final Color disabledBorderColor;

  /// The width of the border surrounding each toggle button.
  ///
  /// This applies to both the greater surrounding border, as well as the
  /// borders rendered between toggle buttons.
  ///
  /// To omit the border entirely, set [renderBorder] to false.
  ///
  /// If this property is null, then a width of 1.0 is used.
  final double borderWidth;

  /// The radii of the border's corners.
  ///
  /// HASN'T BEEN IMPLEMENTED YET
  ///
  /// If this property is null, then non-rounded borders are used.
  final double borderRadius;

  /// The space between two consecutive toggle buttons.
  ///
  /// If this property is null, then a space of 0.0 is used.
  final double spacing;

  /// The space between two consecutive runs of toggle buttons. Runs are
  /// toggle button lines separated due to lack of space.
  ///
  /// If this property is null, then a space of 0.0 is used.
  final double runSpacing;

  /// The direction in which the toggle buttons will be created. Must be of type
  /// [Axis] and can take the values [Axis.horizontal] or [Axis.vertical].
  ///
  /// If this property is null, then direction [Axis.horizontal] is applied.
  final Axis direction;

  /// The elevation of each toggle button.
  ///
  /// If this property is null, then elevation of 0.0 is used.
  final double elevation;

  bool _isFirstIndex(int index) {
    return index == 0;
  }

  bool _isLastIndex(int index) {
    return index == children.length - 1;
  }

  bool _showTopBorder(int index) {
    return true;
    /*if (direction == Axis.horizontal) {
      return true;
    }
    if (spacing > 0) {
      return true;
    }*/
  }

  bool _showLeftBorder(int index) {
    return true;
    /*if (direction == Axis.vertical) {
      return true;
    }
    if (spacing > 0) {
      return true;
    }*/
  }

  bool _showRightBorder(int index) {
    return true;
    /*if (direction == Axis.vertical) {
      return true;
    }

    if (spacing > 0) {
      return true;
    }
    return !_isLastIndex(index);*/
  }

  bool _showBottomBorder(int index) {
    return true;
    /*if (direction == Axis.horizontal) {
      return true;
    }
    if (spacing > 0) {
      return true;
    }
    return _isLastIndex(index);*/
  }

  Border _getBorder(index) {
    Color _borderColor = borderColor;
    if (onPressed == null) {
      _borderColor = disabledBorderColor;
    }
    if (isSelected[index]) {
      _borderColor = selectedBorderColor;
    }

    return Border(
      top: BorderSide(
        width: _showTopBorder(index) ? (borderWidth ?? 1) : 0,
        color: _showTopBorder(index)
            ? (_borderColor ?? Colors.black12)
            : Colors.transparent,
      ),
      left: BorderSide(
        width: _showLeftBorder(index) ? (borderWidth ?? 1) : 0,
        color: _showLeftBorder(index)
            ? (_borderColor ?? Colors.black12)
            : Colors.transparent,
      ),
      right: BorderSide(
        width: _showRightBorder(index) ? (borderWidth ?? 1) : 0,
        color: _showRightBorder(index)
            ? (_borderColor ?? Colors.black12)
            : Colors.transparent,
      ),
      bottom: BorderSide(
        width: _showBottomBorder(index) ? (borderWidth ?? 1) : 0,
        color: _showBottomBorder(index)
            ? (_borderColor ?? Colors.black12)
            : Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      direction: direction,
      children: List<Widget>.generate(
        children.length,
            (index) {
          return _CustomToggleButton(
            child: children[index],
            onPressed: onPressed == null
                ? null
                : () {
              onPressed(index);
            },
            constraints: constraints,
            isSelected: isSelected[index],
            color: color,
            selectedColor: selectedColor,
            fillColor: fillColor,
            disabledFillColor: disabledFillColor,
            unselectedFillColor: unselectedFillColor,
            disabledColor: disabledColor,
            highlightColor: highlightColor,
            splashColor: splashColor,
            hoverColor: hoverColor,
            border: renderBorder ? _getBorder(index) : Border(),
            borderRadius: borderRadius,
            //borderRadius: borderRadius,
            elevation: elevation,
          );
        },
      ),
    );
  }
}

/// An individual toggle button
///
/// This button is used by [CustomToggleButtons] to implement a set of ToggleButtons.
class _CustomToggleButton extends StatelessWidget {
  /// Creates a toggle button based on [RawMaterialButton].
  ///
  /// This class adds some logic to distinguish between enabled, active, and
  /// disabled states, and other attributes that need to be handled per button
  _CustomToggleButton({
    this.child,
    this.onPressed,
    this.constraints = const BoxConstraints(),
    this.isSelected,
    this.color,
    this.selectedColor,
    this.fillColor,
    this.unselectedFillColor,
    this.disabledColor,
    this.disabledFillColor,
    this.highlightColor,
    this.splashColor,
    this.hoverColor,
    this.border,
    this.borderRadius,
    this.elevation,
  });

  final Widget child;
  final VoidCallback onPressed;
  final bool isSelected;

  final Color color;
  final Color selectedColor;
  final Color fillColor;
  final Color unselectedFillColor;
  final Color disabledColor;
  final Color disabledFillColor;
  final Color highlightColor;
  final Color splashColor;
  final Color hoverColor;

  final BoxConstraints constraints;

  final double
  borderRadius; // TODO: Figure out way to make this work with Border
  final BoxBorder border;

  final double elevation;

  Color _getTextColor(context) {
    if (onPressed == null) {
      return disabledColor ??
          Theme.of(context).colorScheme.onSurface.withOpacity(0.38);
    }
    if (isSelected) {
      if (selectedColor == null) {
        return Theme.of(context).colorScheme.primary;
      }
      return selectedColor;
    }
    if (color == null) {
      return Theme.of(context).colorScheme.onSurface;
    }
    return color;
  }

  Color _getFillColor(context) {
    if (onPressed == null) {
      return disabledFillColor ?? Colors.transparent;
    }
    if (isSelected) {
      if (fillColor == null) {
        if (elevation > 0) {
          return Theme.of(context).colorScheme.surface;
        }
        return Colors.transparent;
      }
      return fillColor;
    }
    if (unselectedFillColor == null) {
      if (elevation > 0) {
        return Theme.of(context).colorScheme.surface;
      }
      return Colors.transparent;
    }
    return unselectedFillColor;
  }

  Color _getHighlightColor(context) {
    if (highlightColor == null) {
      return Theme.of(context).highlightColor;
    }
    return highlightColor;
  }

  Color _getSplashColor(context) {
    if (splashColor == null) {
      return Theme.of(context).splashColor;
    }
    return splashColor;
  }

  Color _getHoverColor(context) {
    if (hoverColor == null) {
      return Theme.of(context).hoverColor;
    }
    return hoverColor;
  }

  double _getElevation() {
    if (isSelected) {
      return 0;
    }
    return elevation;
  }

  double _getBorderRadius() {
    if (borderRadius == null) {
      return 0.0;
    }
    return borderRadius;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(12),
      ),
      child: RawMaterialButton(
        textStyle: TextStyle(
          color: _getTextColor(context),
        ),
        constraints:
        constraints ?? BoxConstraints(minWidth: 48.0, minHeight: 48.0),
        fillColor: _getFillColor(context),
        highlightColor: _getHighlightColor(context),
        splashColor: _getSplashColor(context),
        hoverColor: _getHoverColor(context),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(12),
        child: child,
        onPressed: onPressed,
        elevation: _getElevation(),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(_getBorderRadius()),
        // ),
        highlightElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: _getElevation() / 2,
      ),
    );
  }
}
