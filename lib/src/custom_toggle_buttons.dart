part of customtogglebuttons;

// TODO: Alignment, Vertical spacing, Border (shape, style, color, radius),
//

class CustomToggleButtons extends StatelessWidget {
  CustomToggleButtons({
    Key key,
    this.isSelected,
    this.children,
    this.onPressed,
    this.constraints,
    this.showBorders = true,
    this.borderColor,
    this.borderWidth,
    this.spacing = 0,
  })  : assert(children != null),
        assert(isSelected != null),
        assert(children.length == isSelected.length),
        super(key: key);

  final List<bool> isSelected;
  final List<Widget> children;
  final void Function(int index) onPressed;

  final BoxConstraints constraints;

  final bool showBorders;
  final Color borderColor;
  final double borderWidth;

  final double spacing;

  bool _isFirstIndex(int index) {
    return index == 0;
  }

  bool _isLastIndex(int index) {
    return index == children.length - 1;
  }

  bool _showLeftBorder(int index) {
    if (spacing > 0) {
      return true;
    }
    return !_isLastIndex(index);
  }

  bool _showRightBorder(int index) {
    if (spacing > 0) {
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

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      children: List<Widget>.generate(
        children.length,
        (index) {
          return _CustomToggleButton(
            child: children[index],
            fillColor: isSelected[index] ? Colors.green : Colors.transparent,
            onPressed: onPressed == null
                ? null
                : () {
                    onPressed(index);
                  },
            borderColor: borderColor,
            borderWidth: borderWidth,
            hasTopBorder: showBorders,
            hasLeftBorder: showBorders ? _showLeftBorder(index) : false,
            hasRightBorder: showBorders ? _showRightBorder(index) : false,
            hasBottomBorder: showBorders,
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
    this.fillColor,
    this.constraints = const BoxConstraints(),
    this.borderColor,
    this.borderWidth,
    this.hasTopBorder = true,
    this.hasLeftBorder = true,
    this.hasRightBorder = true,
    this.hasBottomBorder = true,
  });

  final Widget child;
  final VoidCallback onPressed;
  final Color fillColor;

  final BoxConstraints constraints;

  final Color borderColor;
  final double borderWidth;
  final bool hasTopBorder;
  final bool hasLeftBorder;
  final bool hasRightBorder;
  final bool hasBottomBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: hasTopBorder
              ? BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Colors.black12,
                )
              : BorderSide.none,
          left: hasLeftBorder
              ? BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Colors.black12,
                )
              : BorderSide.none,
          right: hasRightBorder
              ? BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Colors.black12,
                )
              : BorderSide.none,
          bottom: hasBottomBorder
              ? BorderSide(
                  width: borderWidth ?? 1,
                  color: borderColor ?? Colors.black12,
                )
              : BorderSide.none,
        ),
      ),
      child: RawMaterialButton(
        constraints: constraints,
        fillColor: fillColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.all(12),
        child: child,
        onPressed: onPressed,
        // TODO: Modify Elevation
        elevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
      ),
    );
  }
}
