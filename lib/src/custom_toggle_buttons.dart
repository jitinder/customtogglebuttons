part of customtogglebuttons;

class CustomToggleButtons extends StatelessWidget {
  CustomToggleButtons({
    this.isSelected,
    this.children,
    this.onPressed,
  });

  final List<bool> isSelected;
  final List<Widget> children;
  final void Function(int index) onPressed;

  //TODO: Check that isSelect.length = children.length

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
  });

  final Widget child;
  final VoidCallback onPressed;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: RawMaterialButton(
        constraints: BoxConstraints(),
        fillColor: fillColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        elevation: 0,
        padding: EdgeInsets.all(5.0),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
