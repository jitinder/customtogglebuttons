part of customtogglebuttons;

// TODO: Alignment, Vertical spacing, Border (shape, style, radius)
//    this.disabledColor, -> if onPressed == null
//    this.highlightColor,
//    this.hoverColor,
//    this.splashColor,
//    this.selectedBorderColor,
//    this.disabledBorderColor,

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
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.spacing = 0,
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

  final bool showBorders;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

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
            borderColor: borderColor,
            borderWidth: borderWidth,
            borderRadius: borderRadius,
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
    this.constraints = const BoxConstraints(),
    this.isSelected,
    this.color,
    this.selectedColor,
    this.fillColor,
    this.unselectedFillColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.hasTopBorder = true,
    this.hasLeftBorder = true,
    this.hasRightBorder = true,
    this.hasBottomBorder = true,
  });

  final Widget child;
  final VoidCallback onPressed;
  final bool isSelected;

  final Color color;
  final Color selectedColor;
  final Color fillColor;
  final Color unselectedFillColor;

  final BoxConstraints constraints;

  final Color borderColor;
  final double borderWidth;
  final double
      borderRadius; // TODO: Figure out way to make this work with Border
  final bool hasTopBorder;
  final bool hasLeftBorder;
  final bool hasRightBorder;
  final bool hasBottomBorder;

  Border _getBorder() {
    return Border(
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
    );
  }

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

  Color _getFillColor(){
    if(isSelected){
      if(fillColor == null){
        return Colors.transparent;
      }
      return fillColor;
    }
    if(unselectedFillColor == null){
      return Colors.transparent;
    }
    return unselectedFillColor;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: _getBorder(),
      ),
      child: RawMaterialButton(
        constraints:
            constraints ?? BoxConstraints(minWidth: 48.0, minHeight: 48.0),
        textStyle: TextStyle(color: _getTextColor(context)),
        fillColor: _getFillColor(),
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
