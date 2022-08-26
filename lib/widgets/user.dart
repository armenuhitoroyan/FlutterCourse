
class User {
  String urlImg;
  String name = 'User';
  String status = 'I am using WhatsApp';
  String date = '2016';

   User( 
    this.name, 
    this.status, 
    this.date, 
    {
       this.urlImg = 'https://www.pngfind.com/pngs/m/470-4703547_icon-user-icon-hd-png-download.png',
    }
  );  
}