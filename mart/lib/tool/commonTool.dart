class CommonTool {
  static String selectAvatar(int id) {
    var imageAssets = 'assets/images/avatar01.png';
    switch (id) {
      case 1:
        {
          imageAssets = 'assets/images/avatar01.png';
        }
        break;
      case 2:
        {
          imageAssets = 'assets/images/avatar02.png';
        }
        break;
      case 3:
        {
          imageAssets = 'assets/images/avatar03.png';
        }
        break;
      case 4:
        {
          imageAssets = 'assets/images/avatar04.png';
        }
        break;
      case 5:
        {
          imageAssets = 'assets/images/avatar05.png';
        }
        break;
      case 6:
        {
          imageAssets = 'assets/images/avatar06.png';
        }
        break;
      case 7:
        {
          imageAssets = 'assets/images/avatar07.png';
        }
        break;
    }
    return imageAssets;
  }
}
