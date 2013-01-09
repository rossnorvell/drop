import java.util.*;

public class optionFormat{
	public static void main (String[] args){
		Scanner scan = new Scanner(System.in);
		int count = 1;
		while(scan.hasNext()){
			String line = scan.nextLine();
			String content  = line.substring(line.indexOf(">")+1,line.indexOf("</"));
			System.out.println("INSERT INTO dp_majors(id,name) VALUES("+count+",'"+content.trim()+"');");
			count++;
		}
	}
}