part of customtogglebuttons;

class CustomToggleButtons extends StatelessWidget {
  CustomToggleButtons({
    Key key,
    this.isSelected,
    this.children,
    this.onPressed,
    this.showBorders = true,
    this.spacing = 0,
  })  : assert(children != null),
        assert(isSelected != null),
        assert(children.length == isSelected.length),
        super(key: key);

  final List<bool> isSelected;
  final List<Widget> children;
  final void Function(int index) onPressed;

  final bool showBorders;
  final double spacing;

  bool _isFirstIndex(int index){
    return index == 0;
  }

  bool _isLastIndex(int index){
    return index == children.length - 1;
  }

  bool _showLeftBorder(int index){
    return !_isLastIndex(index);
  }

  bool _showRightBorder(int index){
    if(_isFirstIndex(index)){
      if(children.length <= 2){
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
    this.hasTopBorder = true,
    this.hasLeftBorder = true,
    this.hasRightBorder = true,
    this.hasBottomBorder = true,
  });

  final Widget child;
  final VoidCallback onPressed;
  final Color fillColor;

  final bool hasTopBorder;
  final bool hasLeftBorder;
  final bool hasRightBorder;
  final bool hasBottomBorder;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
//      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: hasTopBorder ? BorderSide(width: 1) : BorderSide.none,
            left: hasLeftBorder ? BorderSide(width: 1) : BorderSide.none,
            right: hasRightBorder ? BorderSide(width: 1) : BorderSide.none,
            bottom: hasBottomBorder ? BorderSide(width: 1) : BorderSide.none,
          ),
        ),
        child: RawMaterialButton(
          constraints: BoxConstraints(),
          fillColor: Theme.of(context).primaryColorLight,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
          padding: EdgeInsets.all(5.0),
          child: child,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
