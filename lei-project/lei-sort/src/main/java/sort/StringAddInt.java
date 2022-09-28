package sort;

/***
 *@author wanglei
 *@Date 2022/4/1 17:33
 ***/


public class StringAddInt {

    public static void main(String[] args) {
        String high = "12";
        String low = "12";
        String add = multiplication(high, low);
        System.err.println(add);

    }

    public static String multiplication(String high, String low) {
        String result = "0";
        if ("0".equals(high) || "0".equals(low)) {
            return "0";
        }
        for (int i = high.length() - 1; i >= 0; i--) {
            int j = low.length() - 1, carry = 0, temp;
            StringBuffer buffer = new StringBuffer();
            //补零
            for (int k = 0; k < high.length() - 1 - i; k++) {
                buffer.append("0");
            }
            int addLeft = high.charAt(i) - '0';
            while (j >= 0 || carry != 0) {
                int addRight = j >= 0 ? low.charAt(j) - '0' : 0;
                temp = addLeft * addRight + carry;
                buffer.append(temp % 10);
                carry = temp / 10;
                j--;
            }
            result = add(result, buffer.reverse().toString());
        }
        return result;
    }


    public static String add(String high, String low) {
        int i = high.length() - 1, j = low.length() - 1, carry = 0, temp;
        StringBuffer buffer = new StringBuffer();

        while (i >= 0 || j >= 0 || carry != 0) {
            int addLeft = i >= 0 ? high.charAt(i) - '0' : 0;
            int addRight = j >= 0 ? low.charAt(j) - '0' : 0;
            temp = addLeft + addRight + carry;
            buffer.append(temp % 10);
            carry = temp / 10;
            i--;
            j--;
        }

        return buffer.reverse().toString();
    }
}
