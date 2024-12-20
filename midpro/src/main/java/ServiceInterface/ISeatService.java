package ServiceInterface;

import java.util.List;

import Vo.ReservationVO;
import Vo.SeatVO;

public interface ISeatService {
	
	/**
	 * 시트정보를 업데이트
	 * @param seatVO
	 * @return
	 */
	public int updateSeat(SeatVO seatVO);
	
	/**
	 * 전체 시트를 보여줌
	 * @return
	 */
	public List<SeatVO> getAllSeat();
	
	/**
	 * 시트 ID( A1(열) )을 받아서 그 시트가 1번인지 0번인지 (1번> 예매된 자리, 0번> 예매 가능한 자리) 알려줌
	 * @param Seat_ID
	 * @return
	 */
	public int getSeatCount(int Seat_ID);
	
	
	/**
	 * 선택된 상영관에 대한 좌석 조회
	 * @param seatVO
	 * @return
	 */
	public List<SeatVO>getReservSeat(ReservationVO reservationVO);
	

}
