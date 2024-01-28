import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'dream_brush_image_model.dart';
export 'dream_brush_image_model.dart';

class DreamBrushImageWidget extends StatefulWidget {
  const DreamBrushImageWidget({
    super.key,
    required this.imageRecord,
  });

  final ImagesRecord? imageRecord;

  @override
  State<DreamBrushImageWidget> createState() => _DreamBrushImageWidgetState();
}

class _DreamBrushImageWidgetState extends State<DreamBrushImageWidget> {
  late DreamBrushImageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DreamBrushImageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('DREAM_BRUSH_IMAGE_Image_0ihkoi8m_ON_TAP');
        logFirebaseEvent('Image_haptic_feedback');
        HapticFeedback.lightImpact();
        logFirebaseEvent('Image_navigate_to');

        context.pushNamed(
          'ImageDetails',
          queryParameters: {
            'imageRef': serializeParam(
              widget.imageRecord?.reference,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      },
      child: Hero(
        tag: widget.imageRecord!.publicUrl,
        transitionOnUserGestures: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: OctoImage(
            placeholderBuilder: OctoPlaceholder.blurHash(
              valueOrDefault<String>(
                widget.imageRecord?.blurhash,
                'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
              ),
            ),
            image: CachedNetworkImageProvider(
              widget.imageRecord!.publicUrl,
            ),
            width: double.infinity,
            height: widget.imageRecord?.ratio == '1024x1792' ? 220.0 : 180.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
