class Singer{
  String _name;
  String _image;
  Singer(this._name,this._image);
  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  @override
  String toString() {
    return 'Singer{_name: $_name, _image: $_image}';
  }
}