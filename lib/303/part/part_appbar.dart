part of "./part_of_learn.dart";

class _PartOfAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _PartOfAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
