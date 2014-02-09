part of injectable_application;

/**
* Annotation used to mark.
*/
class Injectable {
  final Type type;
  final bool requestContext;

  const Injectable({this.type, this.requestContext: false});
}
