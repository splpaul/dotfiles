import java.util.Stack;

class Exercices {
    public static void main(String[] args) {
        String s = "653%*2-4-";
        System.out.println("Forme postfixe : " + s);
        System.out.print("Forme préfixe :");
        printStack(postfixToPrefix(s));
    }

    public static Stack<String> postfixToPrefix(String s) {
        Stack<String> pile = new Stack<String>();
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (isOperator(c)) {
                String a = pile.pop();
                String b = pile.pop();
                String temp = ""+ c + b + a;
                pile.push(temp);
            }
            else {
                pile.push("" + c);
            }
        }
        return pile;
    }

    /* HELPER FUNCTIONS */

    public static boolean isOperator(char c)  {
        return (c == '%' ||  c == '-' || c == '+' || c == '/' || c == '*');
    }

    public static void printStack(Stack<String> s) {
        for (String str: s) {
            System.out.print(str + " ");
        }
    }
}
