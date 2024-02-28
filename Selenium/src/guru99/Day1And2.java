package guru99;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class Day1And2 {
	
 static WebDriver driver;

static String s=System.setProperty("webdriver.chrome.driver", "D:\\Browser drivers\\chromedriver_win32\\chromedriver.exe");

   /* public static  WebDriver browser(String s) {
		 return driver;
	}*/
	
    public static void main(String[] args) {
		// Enter valid uid & pass
	//Day1And2.browser(s);
	
		driver=new ChromeDriver();
		 driver.get("http://www.demo.guru99.com/V4/");
		 driver.findElement(By.name("uid")).sendKeys("mngr352382");
		 driver.findElement(By.name("password")).sendKeys("mujazyt");
		 driver.findElement(By.name("btnLogin")).click();
		 String title=driver.getTitle(); 
	   System.out.println(title);
		 if(title.equals("Guru99 Bank Manager HomePage")) {
			 System.out.println("login successfull");
			 
		 }
		 else {
			 System.out.println("Login failed");
		 }
		

	}

}
