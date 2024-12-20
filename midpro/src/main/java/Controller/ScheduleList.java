package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.JsonParser;

import Service.ScheduleServiceImpl;
import ServiceInterface.IScheduleService;
import Vo.ScheduleVO;

@WebServlet("/scheduleList.do")
public class ScheduleList extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       IScheduleService service = ScheduleServiceImpl.getInstance();
       
       // 선택된 영화 이름, 극장 이름, 지역, 날짜를 요청 파라미터에서 가져옵니다.
        String selectedMovieName = request.getParameter("selectedMovie");
        String selectedTheaterName = request.getParameter("selectedTheater");
        String selectedTheaterDo = request.getParameter("selectedTheaterDo");
        String selectedDate = request.getParameter("selectedDate");
        
        String selectedScreenName = request.getParameter("selectedScreen");               // 추가한 부분

        // ScheduleVO 객체를 생성하고 필요한 필드를 설정합니다.
        ScheduleVO scheduleVO = new ScheduleVO();
        scheduleVO.setMovie_name(selectedMovieName);
        scheduleVO.setTheater_name(selectedTheaterName);
        scheduleVO.setTheater_do(selectedTheaterDo);
        scheduleVO.setSchedule_date(selectedDate);
        
        scheduleVO.setScreen_name(selectedScreenName);                               //추가한 부분
        
        // 모든 상세 일정 가져오기
        List<ScheduleVO> scdList = service.getAllDetail();
        
     // 선택된 영화의 시작일을 JSP에 전달
        if (selectedMovieName != null) {
            for (ScheduleVO schedule : scdList) {
                if (schedule.getMovie_name().equals(selectedMovieName)) {
                    request.setAttribute("selectedStartDate", schedule.getStart_date());
                    break;
                }
            }
        }
        
        // 선택된 영화의 일정 가져오기
//        List<ScheduleVO> scdList2 = service.getScheduleByMovie(scheduleVO);
        
        request.setAttribute("scd", scdList);
//        request.setAttribute("scdList2", scdList2); // 선택된 영화의 일정도 JSP에 전달합니다.
        request.getRequestDispatcher("/schedule/ScheduleList.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
       IScheduleService service = ScheduleServiceImpl.getInstance();
        
        // 선택된 영화 이름, 극장 이름, 지역, 날짜를 요청 파라미터에서 가져옵니다.
        String selectedMovieName = request.getParameter("selectedMovie");
        String selectedTheaterName = request.getParameter("selectedTheater");
        String selectedTheaterDo = request.getParameter("selectedTheaterDo");
        String selectedDate = request.getParameter("selectedDate");
        
        String selectedScreenName = request.getParameter("selectedScreen");            // 추가한 부분
        
        selectedDate = selectedDate.replaceAll("-", ".");

        // ScheduleVO 객체를 생성하고 필요한 필드를 설정합니다.
        ScheduleVO scheduleVO = new ScheduleVO();
        scheduleVO.setMovie_name(selectedMovieName);
        scheduleVO.setTheater_name(selectedTheaterName);
        scheduleVO.setTheater_do(selectedTheaterDo);
        scheduleVO.setSchedule_date(selectedDate);
        
        scheduleVO.setScreen_name(selectedScreenName);                            // 추가한 부분
        
        // 모든 상세 일정 가져오기
        List<ScheduleVO> scdList = service.getAllDetail();
        
        // 선택된 영화의 일정 가져오기
        List<ScheduleVO> scdList2 = service.getScheduleByMovie(scheduleVO);
        

        //리스트 정보 json으로 변환해서 보내기
        Gson gson = new Gson();
        String json = gson.toJson(scdList2);
        response.getWriter().print(json);
       
       
       
    }
}