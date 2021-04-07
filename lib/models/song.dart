class Song{
 String _artistsName;
 String _title;
 String _songurl;
 String _albumphoto;

 String get artistsName => _artistsName;

 @override
  String toString() {
    return 'Song{_artistsName: $_artistsName, _title: $_title, _songurl: $_songurl, _albumphoto: $_albumphoto}';
 }

  set artistsName(String value) {
    _artistsName = value;
  }

 String get title => _title;

 String get albumphoto => _albumphoto;

  set albumphoto(String value) {
    _albumphoto = value;
  }

  String get songurl => _songurl;

  set songurl(String value) {
    _songurl = value;
  }

  set title(String value) {
    _title = value;
  }
}