import 'package:conectar_users_fe/common/utils/reponsivity_util.dart';
import 'package:conectar_users_fe/models/utils/device_screen_type_enum.dart';
import 'package:flutter/material.dart';

class PaginationBuilder extends StatefulWidget {
  const PaginationBuilder({
    required this.totalPages,
    required this.currentPage,
    required this.onTap,
    super.key,
  });

  final int totalPages;
  final int currentPage;
  final void Function(int index) onTap;

  @override
  State<PaginationBuilder> createState() => _PaginationBuilderState();
}

class _PaginationBuilderState extends State<PaginationBuilder> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    const maxVisible = 7;
    final items = <Widget>[];

    void addPage(int index) {
      items.add(
        InkWell(
          customBorder: const CircleBorder(),
          onTap: () {
            if (index == widget.currentPage) return;
            widget.onTap(index);
          },
          child: Container(
            alignment: Alignment.center,
            height: 36,
            width: 36,

            // margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              border: widget.currentPage != index
                  ? null
                  : Border.all(
                      color:
                          colorScheme //
                              .surface
                              .withAlpha(100),
                      width: 3,
                    ),
              borderRadius: BorderRadius.circular(28),
              color: widget.currentPage != index ? null : colorScheme.primary,
            ),
            child: Text(
              '$index',
              style: textTheme.bodyLarge?.copyWith(
                color: widget.currentPage != index
                    ? colorScheme.onPrimaryContainer
                    : colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      );
    }

    void addEllipsis() {
      items.add(
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('...'),
        ),
      );
    }

    if (widget.totalPages <= maxVisible) {
      for (var i = 1; i <= widget.totalPages; i++) {
        addPage(i);
      }
    } else {
      final isMobile =
          ResponsivityUtil().getDeviceType(context) == DeviceScreenType.mobile;
      if (widget.currentPage <= (isMobile ? 1 : 3)) {
        // Início
        for (var i = 1; i <= (isMobile ? 1 : 4); i++) {
          addPage(i);
        }
        addEllipsis();
        addPage(widget.totalPages - 1);
      } else if (widget.currentPage >= widget.totalPages - (isMobile ? 2 : 4)) {
        // Fim
        addPage(0);
        addEllipsis();
        for (
          var i = widget.totalPages - (isMobile ? 2 : 4);
          i < widget.totalPages;
          i++
        ) {
          addPage(i);
        }
      } else {
        // Meio
        addPage(1);
        addEllipsis();
        if (isMobile) {
          addPage(widget.currentPage);
        } else {
          for (
            var i = widget.currentPage - 1;
            i <= widget.currentPage + 1;
            i++
          ) {
            addPage(i);
          }
        }
        addEllipsis();
        addPage(widget.totalPages);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }
}
