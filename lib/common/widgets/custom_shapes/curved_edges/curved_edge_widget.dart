import 'package:ab_ecommerce_admin_panel/common/widgets/custom_shapes/curved_edges/custom_curved_edges.dart';
import 'package:flutter/material.dart';

class AbCurvedEdgeWidget extends StatelessWidget {
  const AbCurvedEdgeWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: AbCustomCurvedEdges(), child: child);
  }
}
