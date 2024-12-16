package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import Service.TheaterServiceImpl;
import ServiceInterface.ITheaterService;
import Vo.TheaterVO;


@WebServlet("/theaterImage.do")
public class TheaterImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//
		// 파라미터로 넘어온 영화관명
		String theaNm = request.getParameter("theaterName");
		
		ITheaterService service = TheaterServiceImpl.getInstance();
		TheaterVO theaVo = service.getTheater(theaNm);
		
		String imgFile = theaVo.getTheater_img();
		if(imgFile==null) imgFile = "noImage.jpg";
		
		
		// 이미지가 저장된 폴더 설정
		String filepath = getServletContext().getRealPath("/theater/영화관이미지");
		File file = new File(filepath, imgFile);
		
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		if(file.exists()) {					// 이미지 파일 있을 때
			try {
				// 출력용 스트림
				bout = new BufferedOutputStream(response.getOutputStream());
				
				// 파일 입력용 스트림
				bin = new BufferedInputStream(new FileInputStream(file));
				
				byte[] temp = new byte[1024];
				int len = 0;
				
				while((len = bin.read(temp)) > 0) {
					bout.write(temp, 0, len);
				}
				bout.flush();
				
			} catch(Exception e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
				if(bin!=null) try { bin.close(); }catch(IOException e) {}
				if(bout!=null) try { bout.close(); }catch(IOException e) {}
				
			}
		}
		
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
