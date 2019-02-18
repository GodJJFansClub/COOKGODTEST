package piciotest;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;



public class FoodScrap {

	public static void main(String[] args) {
		

		Connection.Response response = null;
		
		PrintWriter ps = null;
		try {
			File f = new File("P:/pic/food.sql");
			f.createNewFile();
			ps = new PrintWriter(new BufferedWriter(new FileWriter(f)));
			response = Jsoup.connect("https://www.caca.press/node/ingredients").execute();
			String body = response.body();
			Document data = Jsoup.parse(body);
			
			Elements trs = data.getElementsByClass("panel-default");
			int count = 1;
			// 全部 但有檔案上限無法全拿
//			for(Element e: trs) {
//				System.out.println(e.getElementsByClass("panel-heading").text());
//				for(Element trsChild: e.getElementsByClass("child-link")) {
//					//ps.println("INSERT INTO FOOD (FOOD_ID, FOOD_NAME, FOOD_TYPE) VALUES ('F'||LPAD(TO_CHAR (FOOD_SEQ.NEXTVAL), 5, '0'), " + trsChild.text() + "," + e.getElementsByClass("panel-heading").text() + ")");
//					ps.println("INSERT INTO FOOD (FOOD_ID, FOOD_NAME, FOOD_TYPE) VALUES ('F'||LPAD(TO_CHAR (FOOD_SEQ.NEXTVAL), 5, '0'), '" + trsChild.text() + "'," + "'g" + count + "')");
//				}
//				count++;
//			}
			
			
			for(Element e: trs) {
				
				ps.println("INSERT INTO FOOD (FOOD_ID, FOOD_NAME, FOOD_TYPE) VALUES ('F'||LPAD(TO_CHAR (FOOD_SEQ.NEXTVAL), 5, '0'), '" + e.child(1).child(0).text() + "'," + "'g" + count + "');");
			
				count++;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			ps.close();
		}
		
			
		
			
		
	}

}
