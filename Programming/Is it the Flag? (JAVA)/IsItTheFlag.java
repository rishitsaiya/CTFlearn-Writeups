public class IsItTheFlag {

public static boolean isFlag(String str) {
	return str.hashCode() == 1471587914 && str.toLowerCase().hashCode() == 1472541258;
}

public static void main(String[] args) {

String flag = "------";

if (isFlag(flag))
	System.out.println("You found it!");
else
	System.out.println("Try again :(");

	}
}