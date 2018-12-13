package sample;

import java.io.PrintStream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.ArrayList;

import java.io.File;

class HelloWorldTest {

    private PrintStream defaultPrintStream;
    private PrintStream testPrintStream;

    @Test
    public void testHelloWorld() throws Exception {
        final String expected = "Hello World";
        final List<String> actual = new ArrayList<String>();

        defaultPrintStream = System.out;
        testPrintStream = new PrintStream("hogehoge") {
                @Override
                public void println(String str) {
                    actual.add(str);
                }
            };

        System.setOut(testPrintStream);
        HelloWorld.main(new String[]{});

        assertEquals(expected, actual.get(0));

        System.setOut(defaultPrintStream);
        File file = new File("hogehoge");
        file.delete();
    }
}
