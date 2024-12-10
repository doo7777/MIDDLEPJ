package DaoInterface;

import java.util.List;

import Vo.ProductVO;

public interface IProductDao {
	
	/**
	 * Vo객체 받아 새상품 등록
	 * 상품id, 종류, 이름, 상세설명, 가격, 사진, 상태 
	 * @param productVo
	 * @return
	 */
	public int insertProduct(ProductVO productVo); 
	
	/**
	 * 상품id를 받아 해당상품 삭제
	 * @param product_id
	 * @return
	 */
	public int deleteProduct(String product_id);
	
	/**
	 * 수정할 상품객체 VO에서 가져와 수정
	 * @param productVo
	 * @return
	 */
	public int updateProduct(ProductVO productVo);
	
	
	/**
	 * vo에 저장된 상품리스트 조회
	 * @return
	 */
	public List<ProductVO>ProductList();
	
	/**
	 * 상품id중복체크 , 존재하는 상품번호는 등록불가
	 * 동일상품 수량증가는 신규등록이 아니라 기존상품창으로 접근할것
	 * @param product_id
	 * @return
	 */
	public int getProductCount(String product_id);
	
	
	
}
