package com.cooltrade.common;

public class CommonUtil {
  public static String getRandomAlphaNumeric(int len) {
    char[] charSet = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
        'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };

    int idx = 0;
    StringBuffer sb = new StringBuffer();

    for (int i = 0; i < len; i++) {
      idx = (int) (charSet.length * Math.random());
      sb.append(charSet[idx]);
    }

    return sb.toString();
  }

  public static String getRandomNumeric(int len) {
    char[] charSet = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

    int idx = 0;
    StringBuffer sb = new StringBuffer();

    for (int i = 0; i < len; i++) {
      idx = (int) (charSet.length * Math.random());
      sb.append(charSet[idx]);
    }

    return sb.toString();
  }
}
