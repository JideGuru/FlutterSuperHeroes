class Images {
  Images({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  final String xs;
  final String sm;
  final String md;
  final String lg;

  factory Images.fromJson(Map<String, dynamic> json) {
    final xs = json['xs'];
    final sm = json['sm'];
    final md = json['md'];
    final lg = json['lg'];

    return Images(xs: xs, sm: sm, md: md, lg: lg);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['xs'] = xs;
    data['sm'] = sm;
    data['md'] = md;
    data['lg'] = lg;
    return data;
  }
}
