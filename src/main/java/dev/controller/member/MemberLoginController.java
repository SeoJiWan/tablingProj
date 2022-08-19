package dev.controller.member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import dev.controller.Controller;
import dev.controller.Utils;
import dev.domain.Member;

public class MemberLoginController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		HttpSession ss = req.getSession();
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		Member loginMember = memberService.login(id, pwd);
		System.out.println("loginMember = " + loginMember);
		
		
		if (loginMember == null) {
			System.out.println("로그인 실패");
			resp.getWriter().write("loginFail");
		}
		else {
			System.out.println("로그인 성공");
			// 세션에 로그인한 멤버 저장 
			ss.setAttribute("loginMember", loginMember);
 		}
	}
	
//	private HashMap<String, Object> getUserInfo (String access_Token) {
//	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
//	    HashMap<String, Object> userInfo = new HashMap<>();
//	    String reqURL = "https://kapi.kakao.com/v2/user/me";
//	    try {
//	        URL url = new URL(reqURL);
//	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//	        conn.setRequestMethod("POST");
//	        
//	        //    요청에 필요한 Header에 포함될 내용
//	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
//	        
//	        int responseCode = conn.getResponseCode();
//	        System.out.println("responseCode : " + responseCode);
//	        
//	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//	        
//	        String line = "";
//	        String result = "";
//	        
//	        while ((line = br.readLine()) != null) {
//	            result += line;
//	        }
//	        System.out.println("response body : " + result);
//	        
//	        JsonParser parser = new JsonParser();
//	        JsonElement element = parser.parse(result);
//	        
//	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
//	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
//	        
//	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
//	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
//	        
//	        userInfo.put("nickname", nickname);
//	        userInfo.put("email", email);
//	        
//	    } catch (IOException e) {
//	        // TODO Auto-generated catch block
//	        e.printStackTrace();
//	    }
//	    
//	    return userInfo;
//	
//	}

}
