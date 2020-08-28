part of customtogglebuttons;

// TODO: Alignment, Vertical spacing, Border (shape, style, radius), elevation

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
            disabledColor: disabledColor,
            highlightColor: highlightColor,
            splashColor: splashColor,
            hoverColor: hoverColor,
            borderColor: borderColor,
            selectedBorderColor: selectedBorderColor,
            disabledBorderColor: disabledBorderColor,
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
    this.disabledColor,
    this.highlightColor,
    this.splashColor,
    this.hoverColor,
    this.borderColor,
    this.selectedBorderColor,
    this.disabledBorderColor,
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
  final Color disabledColor;
  final Color highlightColor;
  final Color splashColor;
  final Color hoverColor;

  final BoxConstraints constraints;

  final Color borderColor;
  final Color selectedBorderColor; // TODO: Fix outline drawing logic
  final Color disabledBorderColor;
  final double borderWidth;
  final double borderRadius; // TODO: Figure out way to make this work with Border
  final bool hasTopBorder;
  final bool hasLeftBorder;
  final bool hasRightBorder;
  final bool hasBottomBorder;

  Border _getBorder() {
    Color _borderColor = borderColor;
    if(onPressed == null){
      _borderColor = disabledBorderColor;
    }
    if(isSelected){
      _borderColor = selectedBorderColor;
    }
    return Border(
      top: BorderSide(
        width: hasTopBorder ? borderWidth ?? 1 : 0,
        color: _borderColor ?? Colors.black12,
      ),
      left: BorderSide(
        width: hasLeftBorder ? borderWidth ?? 1 : 0,
        color: _borderColor ?? Colors.black12,
      ),
      right: BorderSide(
        width: hasRightBorder ? borderWidth ?? 1 : 0,
        color: _borderColor ?? Colors.black12,
      ),
      bottom: BorderSide(
        width: hasBottomBorder ? borderWidth ?? 1 : 0,
        color: _borderColor ?? Colors.black12,
      ),
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
    if(onPressed == null){
      return disabledColor;
    }
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
  
  Color _getHighlightColor(context){
    if(highlightColor == null){
      return Colors.transparent;
    }
    return highlightColor;
  }

  Color _getSplashColor(context){
    if(splashColor == null){
      return Theme.of(context).splashColor;
    }
    return splashColor;
  }

  Color _getHoverColor(context){
    if(hoverColor == null){
      return Theme.of(context).hoverColor;
    }
    return hoverColor;
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
        highlightColor: _getHighlightColor(context),
        splashColor: _getSplashColor(context),
        hoverColor: _getHoverColor(context),
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
