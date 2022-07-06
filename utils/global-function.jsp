<%!
  final String changetoRupiahForm(String price){
    String newPrice = "";
    int length = price.length();

    for(int i=0; i<length; i++){
      char digit = price.charAt(length-i-1);
      String currentPrice = newPrice.replace(",","");
      if(currentPrice.length() % 3 == 0 && i > 0){
        newPrice = "," + newPrice;
      }
      newPrice = digit + newPrice;
    }
    return newPrice;
  }
%>