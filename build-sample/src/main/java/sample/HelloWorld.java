package sample;

public class HelloWorld {

    private static String message = "Hello World";

    public static void main(String[] argv) {
        Sayer sayer = new Sayer();
        sayer.say(message);
    }
}
