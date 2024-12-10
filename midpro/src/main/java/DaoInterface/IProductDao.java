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
	 * 수정할 상품객체 VO에서 가져와 수정
	 * @param productVo
	 * @return
	 */
	public int updateProduct(ProductVO productVo);
	/**
	 * 제품 삭제하는 메서드
	 * @param product_ID
	 * @return
	 */
	public int deleteProduct(int product_ID);
	/**
	 * 전체 상품 보여주는 메서드 
	 * @return
	 */
	public List<ProductVO> getAllProduct();
	/**
	 * 상품 이름으로 상품 정보를 보여주는 메서드
	 * @param product_name
	 * @return
	 */
	public ProductVO getProduct(String product_name);
	
	/**
	 * 상품id중복체크 , 존재하는 상품번호는 등록불가
	 * 동일상품 수량증가는 신규등록이 아니라 기존상품창으로 접근할것
	 * @param product_id
	 * @return
	 */
	public int getProductCount(String product_id);
	
	
	
}
