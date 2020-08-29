part of customtogglebuttons;

// TODO: Border (shape, style, radius)

class CustomToggleButtons extends StatelessWidget {
  CustomToggleButtons({
    Key key,
    this.isSelected,
    this.children,
    this.onPressed,
    this.color,
    this.constraints,
    this.showBorders = true,
    this.fillColor,
    this.unselectedFillColor,
    this.selectedColor,
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.hoverColor,
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

  final List<bool> isSelected;
  final List<Widget> children;
  final void Function(int index) onPressed;

  final BoxConstraints constraints;

  final Color color;
  final Color selectedColor;
  final Color fillColor;
  final Color unselectedFillColor;
  final Color disabledColor;
  final Color highlightColor;
  final Color splashColor;
  final Color hoverColor;

  final bool showBorders;
  final Color borderColor;
  final Color selectedBorderColor;
  final Color disabledBorderColor;
  final double borderWidth;
  final double borderRadius;

  final double spacing;
  final double runSpacing;
  final Axis direction;

  final double elevation;

  bool _isFirstIndex(int index) {
    return index == 0;
  }

  bool _isLastIndex(int index) {
    return index == children.length - 1;
  }

  bool _showLeftBorder(int index) {
    if (direction == Axis.vertical) {
      return true;
    }
    if (isSelected[index]) {
      if (index > 0 && isSelected[index - 1]) {
        return false;
      }
      return true;
    }
    if (spacing > 0) {
      return true;
    }
    return !_isLastIndex(index);
  }

  bool _showRightBorder(int index) {
    if (direction == Axis.vertical) {
      return true;
    }
    if (spacing > 0) {
      return true;
    }
    if (isSelected[index]) {
      return true;
    }
    if (_isFirstIndex(index)) {
      if (children.length <= 2) {
        return true;
      }
      return false;
    }
    return true;
  }

  bool _showTopBorder(int index) {
    if (direction == Axis.horizontal) {
      return true;
    }
    if (isSelected[index]) {
      if (index > 0 && isSelected[index - 1]) {
        return false;
      }
      return true;
    }
    if (spacing > 0) {
      return true;
    }
    return !_isLastIndex(index);
  }

  bool _showBottomBorder(int index) {
    if (direction == Axis.horizontal) {
      return true;
    }
    if (spacing > 0) {
      return true;
    }
    if (_isFirstIndex(index)) {
      if (children.length <= 2) {
        return false;
      }
      return true;
    }
    return true;
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
        width: borderWidth ?? 1,
        color: _showTopBorder(index) ? (_borderColor ?? Colors.black12) : Colors
            .transparent,
      ),
      left: BorderSide(
        width: borderWidth ?? 1,
        color: _showLeftBorder(index)
            ? (_borderColor ?? Colors.black12)
            : Colors.transparent,
      ),
      right: BorderSide(
        width: borderWidth ?? 1,
        color: _showRightBorder(index)
            ? (_borderColor ?? Colors.black12)
            : Colors.transparent,
      ),
      bottom: BorderSide(
        width: borderWidth ?? 1,
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
            unselectedFillColor: unselectedFillColor,
            disabledColor: disabledColor,
            highlightColor: highlightColor,
            splashColor: splashColor,
            hoverColor: hoverColor,
            border: showBorders ? _getBorder(index) : BorderSide.none,
            //borderRadius: borderRadius,
            elevation: elevation,
          );
        },
      ),
    );
  }
}

class _CustomToggleButton extends StatelessWidget {
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
  final Color highlightColor;
  final Color splashColor;
  final Color hoverColor;

  final BoxConstraints constraints;

  final double
  borderRadius; // TODO: Figure out way to make this work with Border
  final BoxBorder border;

  final double elevation;

  Color _getTextColor(context) {
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
      return disabledColor;
    }
    if (isSelected) {
      if (fillColor == null) {
        if (elevation > 0) {
          return Theme
              .of(context)
              .colorScheme
              .surface;
        }
        return Colors.transparent;
      }
      return fillColor;
    }
    if (unselectedFillColor == null) {
      if (elevation > 0) {
        return Theme
            .of(context)
            .colorScheme
            .surface;
      }
      return Colors.transparent;
    }
    return unselectedFillColor;
  }

  Color _getHighlightColor(context) {
    if (highlightColor == null) {
      return Colors.transparent;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: border,
      ),
      child: RawMaterialButton(
        constraints:
            constraints ?? BoxConstraints(minWidth: 48.0, minHeight: 48.0),
        textStyle: TextStyle(color: _getTextColor(context)),
        fillColor: _getFillColor(context),
        highlightColor: _getHighlightColor(context),
        splashColor: _getSplashColor(context),
        hoverColor: _getHoverColor(context),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(12),
        child: child,
        onPressed: onPressed,
        elevation: _getElevation(),
        highlightElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: _getElevation() / 2,
      ),
    );
  }
}
